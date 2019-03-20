/********************************************************************
 * file:  statusbridge.cpp
 * brief: source file for data and functionality delivered via the
 *        status-screen
 * info:  None
 ********************************************************************/
#include "statusbridge.h"
/*********************************************************************
* method: StatusBridge
* brief:  Constructor of the StatusBridge Object
*         Creation of all the required Objects
*         Performing all the required configs and connections
* params: none
*********************************************************************/
StatusBridge::StatusBridge(QObject *parent, Model* diModel) : QObject(parent)
{
    refMod = diModel;

    QTimer *timeUpdater = new QTimer(this);
    connect(timeUpdater, SIGNAL(timeout()),this,SLOT(timeStatusUpdating()));
    timeUpdater->start(1000);

    timeIniter = new QTimer(this);
    connect(timeIniter, SIGNAL(timeout()),this,SLOT(timeInit()));
    timeIniter->start(1000);
}
/*********************************************************************
* method: timeInit
* brief:  Perfroms a timied init after a second.
* params: NONE
*********************************************************************/
void StatusBridge::timeInit()
{
    sendTimeJal(QString::number(10000));
    sendTimeZip(QString::number(10000));
    updateSliderJal(10000);
    updateSliderZip(10000);

    sendWindJal(QString::number(400));
    sendWindZip(QString::number(600));
    updateSliderJalWind(400);
    updateSliderZipWind(600);

    refMod->windLimitZip = 600;
    refMod->windLimtJal = 400;

    timeIniter->stop();

}

/*********************************************************************
* method: timeInfoUpdating
* brief:  Perfroms a cyclical update (once per second) of the home
*         slide screen.
* params: NONE
*********************************************************************/
void StatusBridge::timeStatusUpdating()
{
    QString textTO = QString::number(refMod->myCom->errorCntTimeOut);
    sendTimeOutErrorCount(textTO);//(refMod->myCom->errorCntTimeOut);
    QString textCRC = QString::number(refMod->myCom->errorCntCrc);
    sendCommunicationErrorCount(textCRC);

}
/*********************************************************************
* method: jalTimingAll
* brief:  Defines the timing used for the jals being powered for
*         moving up / down
* params: NONE
*********************************************************************/
void StatusBridge::jalTimingAll(int data)
{
    sendTimeJal(QString::number(data));
}
/*********************************************************************
* method: zipTimingAll
* brief:  Defines the timing used for the zips being powered for
*         moving up / down
* params: NONE
*********************************************************************/
void StatusBridge::zipTimingAll(int data)
{
    sendTimeZip(QString::number(data));
}
/*********************************************************************
* method: jalTimingAll
* brief:  Defines the timing used for the jals being powered for
*         moving up / down
* params: NONE
*********************************************************************/
void StatusBridge::jalWind(int data)
{
    sendWindJal(QString::number(data));
    refMod->windLimtJal = data;
}
/*********************************************************************
* method: zipTimingAll
* brief:  Defines the timing used for the zips being powered for
*         moving up / down
* params: NONE
*********************************************************************/
void StatusBridge::zipWind(int data)
{
    sendWindZip(QString::number(data));
    refMod->windLimitZip = data;
}
