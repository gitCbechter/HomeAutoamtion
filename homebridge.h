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
signals:
    void sendTimeInfo(QString timeString, QString dateString);
    void sendOutTempInfo(QString temperatureString);
    void sendInTempInfo(QString temperatureString);
    void sendOutHumiInfo(QString humiString);
    void sendInHumiInfo(QString humiString);
    void sendPressInfo(QString pressString);
    void sendWindSpeedInfo(QString windSpeedString);

public slots:
    //C++
    void timeInfoUpdating();
    void timeSensorUpdating();

};

#endif // HOMEBRIDGE_H
