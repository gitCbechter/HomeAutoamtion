/********************************************************************
 * file:  ctrlbridge.cpp
 * brief: source file for data and functionality delivered via the
 *        control-screen
 ********************************************************************/
#include "ctrlbridge.h"
#include <QDebug>
#include <QDate>
#include <QTime>
#include <QTimer>
#include <QtNetwork>
#include "com.h"
/*********************************************************************
* method: CtrlBridge
* brief:  Constructor of the CtrlBridge Object
*         Creation of all the required Objects
*         Performing all the required configs and connections
* params: diModel, injected model for data handling
*********************************************************************/
CtrlBridge::CtrlBridge(QObject *parent, Model* diModel) : QObject(parent)
{
    refMod = diModel;

    timerLamTimeTx = new QTimer(this);
    connect(timerLamTimeTx, SIGNAL(timeout()),this,SLOT(timerLamTimeTxTrigger()));
}
/*********************************************************************
* method: zipButtonSleep
* brief:  Operates and commands the ZIP-Screens of the sleeping room
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::zipButtonSleep(int data)
{
    qDebug() << "Button at Ctrl Page SLEEP pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_SLEEPING,ZIPSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_SLEEPING,ZIPUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_SLEEPING,ZIPDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_ZIP,ZIP_SLEEPING,ZIPSTOP_CMD);
        break;
    }
}
/*********************************************************************
* method: zipButtonPrincess
* brief:  Operates and commands the ZIP-Screens of the princess room
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::zipButtonPrincess(int data)
{
    qDebug() << "Button at Ctrl Page PRINCESS pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_PRINCESS,ZIPSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_PRINCESS,ZIPUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_PRINCESS,ZIPDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_ZIP,ZIP_PRINCESS,ZIPSTOP_CMD);
        break;
    }
}
/*********************************************************************
* method: zipButtonMessy
* brief:  Operates and commands the ZIP-Screens of the messy room
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::zipButtonMessy(int data)
{
    qDebug() << "Button at Ctrl Page MESSY pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_PRINCESS,ZIPSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_MESSY,ZIPUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_ZIP,ZIP_MESSY,ZIPDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_ZIP,ZIP_MESSY,ZIPSTOP_CMD);
        break;
    }
}
//TERRACE DOOR
/*********************************************************************
* method: jalButtonTerrace
* brief:  Operates and commands the JALOUSIE of the Terrace door
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::jalButtonTerrace(int data)
{
    qDebug() << "Button at Ctrl Page TERRACE pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_TERRACE,JALSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_TERRACE,JALUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_TERRACE,JALDWN_CMD);
        break;
        case 3://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_TERRACE,LAMUP_CMD);
        break;
        case 4://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_TERRACE,LAMDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_JAL,JAL_TERRACE,JALSTOP_CMD);
        break;
    }
}

//ALL the JALOUSIES
/*********************************************************************
* method: jalButtonAll
* brief:  Operates and commands ALL the JALOUSIES
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::jalButtonAll(int data)
{
    qDebug() << "Button at Ctrl Page AllGround pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_ALL,JALSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_ALL,JALUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_ALL,JALDWN_CMD);
        break;
        case 3://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_ALL,LAMUP_CMD);
        break;
        case 4://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_ALL,LAMDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_JAL,JAL_ALL,JALSTOP_CMD);
        break;
    }
}
/*********************************************************************
* method: jalCheckBoxAll
* brief:  Enalbes or Disables Automatic control for ALL the
*         JALOUSIES, via the Bus System
* params: data, true/false
*********************************************************************/
void CtrlBridge::jalCheckBoxAll(bool data)
{   
    qDebug() << "Auto Check at Ctrl Page AllGround pressed: " << data;
    if(data)
    {
        refMod->jals[0].automatic = 1;
        refMod->jals[1].automatic = 1;
        refMod->jals[2].automatic = 1;
        refMod->jals[3].automatic = 1;
    }
    else
    {
        refMod->jals[0].automatic = 0;
        refMod->jals[1].automatic = 0;
        refMod->jals[2].automatic = 0;
        refMod->jals[3].automatic = 0;
    }

}

/*********************************************************************
* method: jalLamTimeAll
* brief:  Operates and commands of ALL the JALOUSIES
*         via the bus as desired by the user
* params: data, time spent for changing lammella angle
*********************************************************************/
void CtrlBridge::jalLamTimeAll(int data)
{
    qDebug() << "Time LAM at Ctrl Page AllGround pressed: " << data;
    refMod->jals[0].time = static_cast<uint16_t>(data);
    refMod->jals[1].time = static_cast<uint16_t>(data);
    refMod->jals[2].time = static_cast<uint16_t>(data);
    refMod->jals[3].time = static_cast<uint16_t>(data);
    timerLamTimeTx->stop();
    timerLamTimeTx->start(200);
}
void CtrlBridge::timerLamTimeTxTrigger()
{
    timerLamTimeTx->stop();
    refMod->updateActorData(ACTOR_JAL,refMod->jals[0].time,JALLAMTIME_CMD);
}
//Window Kitchen Functionalities
/*********************************************************************
* method: jalButtonKitchenWin
* brief:  Operates and commands the Kitchen window JALOUSIE
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::jalButtonLiving(int data)
{
    qDebug() << "Button at Ctrl Page ButtonLiving pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_LIVING,JALSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_LIVING,JALUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_LIVING,JALDWN_CMD);
        break;
        case 3://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_LIVING,LAMUP_CMD);
        break;
        case 4://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_LIVING,LAMDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_JAL,JAL_LIVING,JALSTOP_CMD);
        break;
    }
}

// Door Kitchen Functionalities
/*********************************************************************
* method: jalButtonKitchenWin
* brief:  Operates and commands the Kitchen window JALOUSIE
*         via the bus as desired by the user
* params: data, 1 -> UP pressed / -1 -> UP timed out
*               2 -> DWN pressed / -2 -> DWN timed out
*               0 -> STOP pressed
*********************************************************************/
void CtrlBridge::jalButtonEating(int data)
{
    qDebug() << "Button at Ctrl Page ButtonEating pressed: " << data;
    switch(data)
    {
        case 0://STOP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_EATING,JALSTOP_CMD);
        break;
        case 1://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_EATING,JALUP_CMD);
        break;
        case 2://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_EATING,JALDWN_CMD);
        break;
        case 3://UP pressed
            refMod->updateActorData(ACTOR_JAL,JAL_EATING,LAMUP_CMD);
        break;
        case 4://DWN pressed
            refMod->updateActorData(ACTOR_JAL,JAL_EATING,LAMDWN_CMD);
        break;
        default:
            refMod->updateActorData(ACTOR_JAL,JAL_EATING,JALSTOP_CMD);
        break;
    }
}











/*********************************************************************
* method: hutLightSwitched
* brief:  Operates and commands the huts light
* params: data, 1 light on / -1 Light off
*********************************************************************/
void CtrlBridge::hutLightSwitched(int data)
{
    qDebug() << "Button Toggling status of Hut Light: " << data;
}
/*********************************************************************
* method: outPumpSwitched
* brief:  Operates and commands the powering of the pump plug
* params: data, 1 light on / -1 Light off
*********************************************************************/
void CtrlBridge::outPumpSwitched(int data)
{
    qDebug() << "Button Toggling status of Power Pump: " << data;
}
/*********************************************************************
* method: indoorWindow
* brief:  Operates and commands the indoor window regarding open and close
* params: data, 1 open / 0 stop / -1 Light close
*********************************************************************/
void CtrlBridge::indoorWindow(int data)
{
    qDebug() << "Button Toggling status of Indoor Window: " << data;
}
