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
    windLimitZip = 400;//windSpeed in cm/s
    windLimtJal = 800;//windSpeed in cm/s

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
void Model::getIndoorData()
{
    sensorIn[0].temp = myCom->indoorTemp;
    sensorIn[0].humi = myCom->indoorHumi;
    sensorIn[0].press = myCom->indoorPress;

}
void Model::getOutdoorData()
{
    sensorOut[0].temp = myCom->outdoorTemp;
    sensorOut[0].wind = myCom->windSpeed;
    sensorOut[0].humi = myCom->outdoorHumi;
}


