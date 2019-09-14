/********************************************************************
 * file:  homebridge.cpp
 * brief: source file for data and functionality delivered via the
 *        home-screen
 * info:  None
 ********************************************************************/
#include "homebridge.h"
#include <QDebug>
#include <QDate>
#include <QTime>
#include <QTimer>
#include <QtNetwork>
/*********************************************************************
* method: HomeBridge
* brief:  Constructor of the HomeBridge Object
*         Creation of all the required Objects
*         Performing all the required configs and connections
* params: diModel, injected model for data handling
*********************************************************************/
HomeBridge::HomeBridge(QObject *parent, Model* diModel) : QObject(parent)
{
        refMod = diModel;
        sensorSSM = SSMIDLE;

        myNews = new NewsTickerData();

        newsIndex = 0;
        newsNum = 0;


        QTimer *timeUpdater = new QTimer(this);
        connect(timeUpdater, SIGNAL(timeout()),this,SLOT(timeInfoUpdating()));
        timeUpdater->start(1000);

        timerSensors = new QTimer(this);
        connect(timerSensors, SIGNAL(timeout()),this,SLOT(timeSensorUpdating()));
        timerSensors->start(5000);



        //News Ticker
        QTimer *timerTicker = new QTimer(this);
        connect(timerTicker, SIGNAL(timeout()),this,SLOT(tickerUpdating()));
        timerTicker->start(600000);

        //QTimer *newsTicker = new QTimer(this);
        //connect(newsTicker, SIGNAL(timeout()),this,SLOT(tickerInfoUpdating()));
        //newsTicker->start(30000);
        timerNewsUpdater = new QTimer(this);
        connect(timerNewsUpdater, SIGNAL(timeout()),this,SLOT(tickerInfoUpdating()));
        timerNewsUpdater->start(2500);

        managerTicker = new QNetworkAccessManager();
        connect(managerTicker, SIGNAL(finished(QNetworkReply*)),this, SLOT(tickerFinished(QNetworkReply*)));
        requestTicker.setUrl(QUrl("http://newsapi.org/v2/top-headlines?country=de&apiKey=2623df2d10004ff7990f5f2fe5e3fe37"));
        managerTicker->get(requestTicker);
}
/*********************************************************************
* method: weatherUpdating
* brief:  Performs a request for getting the updated weather info
*         Important is to have the key for do the request @openweathermap
* params: None
*********************************************************************/
void HomeBridge::tickerUpdating()
{
    qDebug() << "Do a Weather Forecast update";

    requestTicker.setUrl(QUrl("http://newsapi.org/v2/top-headlines?country=de&apiKey=2623df2d10004ff7990f5f2fe5e3fe37"));
    managerTicker->get(requestTicker);



}
/*********************************************************************
* method: tickerFinished
* brief:  Perfroms an update to the ticker data
* params: NONE
*********************************************************************/
void HomeBridge::tickerFinished(QNetworkReply *reply)
{
    qDebug() << "Got the News update";
    int i;
    //QVector<NewsTickerData> ntds(64);
    if (reply->error()) {
        qDebug() << reply->errorString();
        return;
    }

    QString answer = reply->readAll();
    qDebug() << answer;
    QJsonDocument jsonResponse = QJsonDocument::fromJson(answer.toUtf8());
    QJsonObject object = jsonResponse.object();
    QJsonValue values = object.value("articles");
    QJsonArray array = values.toArray();
    i = 0;
    foreach (const QJsonValue & v, array)
    {
           //ntds[i].date = v.toObject().value("publishedAt").toString();
           //ntds[i].title = v.toObject().value("title").toString();
           //ntds[i].description = v.toObject().value("description").toString();
           myNews->date[i]= v.toObject().value("publishedAt").toString();
           myNews->title[i]= v.toObject().value("title").toString();
           myNews->description[i]= v.toObject().value("description").toString();
           i++;
           if(i==64)
           {
               break;
           }
    }
    newsNum = i;
    qDebug() << "Got the News update";
}
/*********************************************************************
* method: tickerInfoUpdating
* brief:  Perfroms a cyclical update (once per second) of the home
*         slide screen.
* params: NONE
*********************************************************************/
void HomeBridge::tickerInfoUpdating()
{
    timerNewsUpdater->stop();
    sendLine1(myNews->title[newsIndex]);
    sendLine2(myNews->description[newsIndex]);
    sendLine3(myNews->date[newsIndex]);
    newsIndex++;
    if(newsIndex>newsNum)
    {
        newsIndex = 0;
    }
    timerNewsUpdater->start(30000);
}
/*********************************************************************
* method: timeInfoUpdating
* brief:  Perfroms a cyclical update (once per second) of the home
*         slide screen.
* params: NONE
*********************************************************************/
void HomeBridge::timeInfoUpdating()
{
    QDate cd = QDate::currentDate();
    QTime ct = QTime::currentTime();
    Calcs *doCalc = new Calcs();

    refMod->pSensorIndexSet(SENSOR_0);
    refMod->getIndoorData();
    QString temperatureStringOut = doCalc->valTemp2String(refMod->pReadTempOut());
    QString humiStringOut = doCalc->valHumi2String(refMod->pReadHumiOut());
    QString windSpeedString = doCalc->valWind2String(refMod->pReadWindOut());

    refMod->pSensorIndexSet(SENSOR_0);
    refMod->getOutdoorData();
    QString temperatureStringIn = doCalc->valTemp2String(refMod->pReadTempIn());
    QString humiStringIn = doCalc->valHumi2String(refMod->pReadHumiIn());
    QString pressString = doCalc->valPress2String(refMod->pReadPressIn());

    ct = ct.addSecs(3600);
    if(ct.hour()==0)
    {
        cd = cd.addDays(1);
    }
    sendTimeInfo(ct.toString("hh:mm"), cd.toString("ddd   dd - MMM - yyyy"));

    sendOutTempInfo(temperatureStringOut);
    sendInTempInfo(temperatureStringIn);
    sendOutHumiInfo(humiStringOut);
    sendInHumiInfo(humiStringIn);
    sendPressInfo(pressString);
    sendWindSpeedInfo(windSpeedString);
}
/*********************************************************************
* method: timeSensorIndoorUpdating
* brief:  Triggers the updating of the indoor sensor data
* params: NONE
*********************************************************************/
void HomeBridge::timeSensorUpdating()
{
    timerSensors->stop();
    switch(sensorSSM)
    {
        case SSMIDLE:
            sensorSSM = SENSORIN1;
            //refMod->protocolHandler();
            //timerSensors->start(2000);
        break;
        case SENSORIN1:
            //refMod->updateIndoorSensorData(SENSOR_0);
            sensorSSM = SENSOROUT1;
            //timerSensors->start(2000);
        break;
        case SENSOROUT1:
            //refMod->updateOutdoorSensorData(SENSOR_0);
            sensorSSM = SSMIDLE;
            //timerSensors->start(2000);
        break;
    }
}

