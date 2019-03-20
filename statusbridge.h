/********************************************************************
 * file:  statusbridge.h
 * brief: header file for data and functionality delivered via the
 *        status-screen
 ********************************************************************/
#ifndef STATUSBRIDGE_H
#define STATUSBRIDGE_H
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
/*********************************************************************
*Defines & Enums
*********************************************************************/


/*********************************************************************
*Classes & Structs
*********************************************************************/
class StatusBridge : public QObject
{
    Q_OBJECT
public:
    explicit StatusBridge(QObject *parent = nullptr, Model *diMod = nullptr);
    Model *refMod; //the global and generic model objects reference
    QTimer *timeIniter;

signals:
    void sendTimeOutErrorCount(QString timeOutErrCnt);
    void sendCommunicationErrorCount(QString commErrCnt);

    void sendTimeJal(QString timeJal);
    void sendTimeZip(QString timeZip);
    void updateSliderJal(int val);
    void updateSliderZip(int val);

    void sendWindJal(QString windJal);
    void sendWindZip(QString windZip);
    void updateSliderJalWind(int val);
    void updateSliderZipWind(int val);

public slots:
    void timeStatusUpdating();
    void timeInit();

    void jalTimingAll(int data);
    void zipTimingAll(int data);

    void jalWind(int data);
    void zipWind(int data);
};

#endif // STATUSBRIDGE_H
