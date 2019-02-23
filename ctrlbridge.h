/********************************************************************
 * file:  ctrlbridge.h
 * brief: header file for data and functionality delivered via the
 *        control-screen
 ********************************************************************/
#ifndef CTRLBRIDGE_H
#define CTRLBRIDGE_H
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
class CtrlBridge : public QObject
{
    Q_OBJECT
public:
    explicit CtrlBridge(QObject *parent = nullptr, Model *diMod = nullptr);
    Model *refMod; //the global and generic model objects reference

    QTimer *timerLamTimeTx;  //Timer for handling timing adjustments to teh lammella timing
signals:
    void expBtnChanged(int index);
public slots:
    void timerLamTimeTxTrigger();
    //Slots trigger from QML
    void zipButtonPrincess(int data);
    void zipButtonSleep(int data);
    void zipButtonMessy(int data);

    void jalButtonTerrace(int data);

    void jalButtonAll(int data);
    void jalCheckBoxAll(bool data);
    void jalLamTimeAll(int data);

    void jalButtonLiving(int data);

    void jalButtonEating(int data);



    void hutLightSwitched(int data);
    void outPumpSwitched(int data);
    void indoorWindow(int data);

};

#endif // CTRLBRIDGE_H
