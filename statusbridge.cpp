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
