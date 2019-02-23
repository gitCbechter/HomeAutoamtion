/********************************************************************
 * file:  model.cpp
 * brief: source file for the data handling layer for the sensors,
 *        actors and IO stuff
 * info:  bases on the HAL - Object being created
 *        Via DI it is used throughout the reat of the project in case
 *        data accessing or commanding via the HAL
 ********************************************************************/
#include "model.h"
/*********************************************************************
* method: Model
* brief:  Constructor of the Model Object
*         Creation of all the required Objects
*         Performing all the required configs and connections
* params: NONE
*********************************************************************/
Model::Model()
{
    myCom = new Com();
    sensorDataInit();
    for(int i=0; i<7; i++)
    {
        jals[i].time = 0;
        jals[i].automatic = 0;
    }

}
/*********************************************************************
* method: sensorDataInit
* brief:  Basic init for all the available sensor data
* params: None
*********************************************************************/
void Model::sensorDataInit()
{
    int i;
    for(i=0;i<4;i++){
        sensorIn[i].temp = 0x00000000;
        sensorIn[i].press = 0x00000000;
        sensorIn[i].wind = 0x00000000;
        sensorIn[i].humi = 0x00000000;
        sensorOut[i].temp = 0x00000000;
        sensorOut[i].press = 0x00000000;
        sensorOut[i].wind = 0x00000000;
        sensorOut[i].humi = 0x00000000;
    }
}
/*********************************************************************
* method: updateIndoorSensorData
* brief:  Updates the data structure of the desired indoor Sensor
*         The timerOut takes care to prevent the system from haning up
*         The timerRS485Com handles the SW flow for the data transaction
*         via RS485
*         The status variable detailing the RS485 state is updated
*         accordingly
* params: index, eSensorIndex enum defining the desired sensor to be
*         updated
*********************************************************************/
void Model::updateIndoorSensorData(eSensorIndex index)
{
    myCom->requestIndoorData(index);
}
/*********************************************************************
* method: updateOutdoorSensorData
* brief:  Updates the data structure of the desired outdoor Sensor
*         The timerOut takes care to prevent the system from haning up
*         The timerRS485Com handles the SW flow for the data transaction
*         via RS485
*         The status variable detailing the RS485 state is updated
*         accordingly
* params: index, eSensorIndex enum defining the desired sensor to be
*         updated
*********************************************************************/
void Model::updateOutdoorSensorData(eSensorIndex index)
{
    myCom->requestOutdoorData(index);
}
/*********************************************************************
* method: updateActorOnOffData
* brief:  Commands the actor indexed by sending out the constructed data
*         The timerOut takes care to prevent the system from haning up
*         The timerRS485Com handles the SW flow for the data transaction
*         via RS485
*         The status variable detailing the RS485 state is updated
*         accordingly
* params: index, eSensorIndex enum defining the desired actor to be
*         commanded
*         data, 16 bit each output is to be defined for a single command
*********************************************************************/
void Model::updateActorData(eActorIndex index, uint16_t data, eActorCmdType cmd)
{
    myCom->setActorContent(index, data, cmd);
}
/*********************************************************************
* method: protocolHandler
* brief:  UART protoccol analyzer. Gets the data and acts accordingly
* params: len, the length of the received data without the CRC
* type|index|Data....... |CRCh|CRCl
* DATA:
* type==Indoor -> tempH|tempL|HumiH|HumiL|PressH|PressL
* type==Outdoor -> tempH|tempL|WindH|WindL|HumiH|HumiL|
*********************************************************************/
void Model::protocolHandler()
{
    uint8_t index;
    index = myCom->rxIndexDone;
    if(myCom->rxIndexPending!=myCom->rxIndexDone)
    {
        switch(myCom->rxBuffer[index][0])
        {
            case ADR_OUTDOOR:
                sensorOut[myCom->rxBuffer[index][1]].temp = myCom->rxBuffer[index][2]<<8 | myCom->rxBuffer[index][3];
                sensorOut[myCom->rxBuffer[index][1]].wind = myCom->rxBuffer[index][4]<<8 | myCom->rxBuffer[index][5];
                sensorOut[myCom->rxBuffer[index][1]].humi = myCom->rxBuffer[index][6]<<8 | myCom->rxBuffer[index][7];
            break;
            case ADR_INDOOR:
                sensorIn[myCom->rxBuffer[index][1]].temp = myCom->rxBuffer[index][2]<<8 | myCom->rxBuffer[index][3];
                sensorIn[myCom->rxBuffer[index][1]].humi = myCom->rxBuffer[index][4]<<8 | myCom->rxBuffer[index][5];
                sensorIn[myCom->rxBuffer[index][1]].press = myCom->rxBuffer[index][6]<<8 | myCom->rxBuffer[index][7];
            break;
            case ADR_ACTOR:

            break;
            default:
                qDebug() << "ERROR-> UART communication -> Wrong Protocol!";
            break;
        }
        myCom->rxIndexDone = (myCom->rxIndexDone + 1)&0x0F;
    }
}

