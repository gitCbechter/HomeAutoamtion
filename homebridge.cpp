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

        QTimer *timeUpdater = new QTimer(this);
        connect(timeUpdater, SIGNAL(timeout()),this,SLOT(timeInfoUpdating()));
        timeUpdater->start(1000);

        timerSensors = new QTimer(this);
        connect(timerSensors, SIGNAL(timeout()),this,SLOT(timeSensorUpdating()));
        timerSensors->start(5000);
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
    QString temperatureStringOut = doCalc->valTemp2String(refMod->pReadTempOut());
    QString humiStringOut = doCalc->valHumi2String(refMod->pReadHumiOut());
    QString windSpeedString = doCalc->valWind2String(refMod->pReadWindOut());

    refMod->pSensorIndexSet(SENSOR_0);
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
            refMod->protocolHandler();
            timerSensors->start(2000);
        break;
        case SENSORIN1:
            refMod->updateIndoorSensorData(SENSOR_0);
            sensorSSM = SENSOROUT1;
            timerSensors->start(2000);
        break;
        case SENSOROUT1:
            refMod->updateOutdoorSensorData(SENSOR_0);
            sensorSSM = SSMIDLE;
            timerSensors->start(2000);
        break;
    }
}

