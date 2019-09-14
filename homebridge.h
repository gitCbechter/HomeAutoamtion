/********************************************************************
 * file:  homebridge.h
 * brief: header file for data and functionality delivered via the
 *        home-screen
 ********************************************************************/
#ifndef HOMEBRIDGE_H
#define HOMEBRIDGE_H
/*********************************************************************
*Includes
*********************************************************************/
#include <QObject>
#include <QTimer>
#include <QtNetwork>
#include <QDebug>
#include <QDate>
#include <QTime>
#include "model.h"
#include "calcs.h"
#include "newstickerdata.h"
/*********************************************************************
*Defines & Enums
*********************************************************************/
enum eSensorDataState {SSMIDLE=0, SENSORIN1 = 1, SENSOROUT1 = 2};

/*********************************************************************
*Classes & Structs
*********************************************************************/
class HomeBridge : public QObject
{
    Q_OBJECT
public:
    explicit HomeBridge(QObject *parent = nullptr, Model *diMod = nullptr);
    Model *refMod; //the global and generic model objects reference
    QTimer *timerSensors;
    eSensorDataState sensorSSM;

    QNetworkAccessManager *managerTicker;//http request manger
    QNetworkRequest requestTicker;//http request
    NewsTickerData *myNews;
    QTimer *timerNewsUpdater;
    int newsIndex;
    int newsNum;

signals:
    void sendTimeInfo(QString timeString, QString dateString);
    void sendOutTempInfo(QString temperatureString);
    void sendInTempInfo(QString temperatureString);
    void sendOutHumiInfo(QString humiString);
    void sendInHumiInfo(QString humiString);
    void sendPressInfo(QString pressString);
    void sendWindSpeedInfo(QString windSpeedString);
    void sendLine1(QString txt);
    void sendLine2(QString txt);
    void sendLine3(QString txt);


public slots:
    //C++
    void timeInfoUpdating();
    void timeSensorUpdating();
    void tickerUpdating();
    void tickerFinished(QNetworkReply *reply);
    void tickerInfoUpdating();

};

#endif // HOMEBRIDGE_H
