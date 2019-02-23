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
signals:
    void sendTimeOutErrorCount(QString timeOutErrCnt);
    void sendCommunicationErrorCount(QString commErrCnt);
public slots:
    void timeStatusUpdating();
};

#endif // STATUSBRIDGE_H
