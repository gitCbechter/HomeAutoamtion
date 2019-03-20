/********************************************************************
 * file:  model.h
 * brief: header file for the data handling layer for the sensors and
 *        actors
 ********************************************************************/
#ifndef MODEL_H
#define MODEL_H
/*********************************************************************
*Includes
*********************************************************************/
#include <QObject>
#include <QTimer>
#include <QDebug>
#include "hal.h"
#include "calcs.h"
#include "com.h"
/*********************************************************************
*Defines & Enums
*********************************************************************/

/*********************************************************************
*Classes & Structs
*********************************************************************/
struct sDataSensor
{
    int temp;   //Sensor meas. Temperaqture
    int press;  //Sensor meas. Pressure
    int humi;   //Sensor meas. Humidity
    int wind;   //Sensor meas. Wind Speed
    int status; //Status od the Snesor node
};

struct sDataActor
{
    uint16_t data;   //Actor data.
    uint16_t status; //Actor status.
};
struct sJalConfigs
{
    uint16_t time;
    uint16_t automatic;
};

class Model : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int pTempOut READ pReadTempOut)
    Q_PROPERTY(int pTempIn READ pReadTempIn)
    Q_PROPERTY(int pHumiOut READ pReadHumiOut)
    Q_PROPERTY(int pHumiIn READ pReadHumiIn)
    Q_PROPERTY(int pWind READ pReadWindOut)
    Q_PROPERTY(int pPress READ pReadPressIn)
    Q_PROPERTY(eSensorIndex pSensorIndex READ pSensorIndex WRITE pSensorIndexSet)
    Q_PROPERTY(eActorIndex pActorIndex READ pActorIndex WRITE pActorIndexSet)
    Q_PROPERTY(uint16_t pActorData READ pActorDataGet WRITE pActorDataSet)
    Q_PROPERTY(uint16_t pActorStatus READ pActorStatusGet WRITE pActorStatusSet)

public:
    //Methods
    Model();
    void sensorDataInit();
    void updateIndoorSensorData(eSensorIndex index);
    void updateOutdoorSensorData(eSensorIndex index);
    void updateActorData(eActorIndex index, uint16_t data, eActorCmdType cmd);

    void protocolHandler();


    //Members
    Com *myCom; //the centralistic (DI) HAL-Object everything will be based on

    int windLimitZip;
    int windLimtJal;

    sDataSensor sensorOut[4];
    sDataSensor sensorIn[4];
    sDataActor actor[8];

    sJalConfigs jals[4];

    eSensorIndex indexSensor;
    eActorIndex indexActor;

    //property definitions for accessing data
    eSensorIndex pSensorIndex() const{
        return indexSensor;
    }
    void pSensorIndexSet(eSensorIndex val){
        indexSensor = val;
    }
    int pReadTempOut() const{
        return sensorOut[pSensorIndex()].temp;
    }
    int pReadTempIn() const{
        return sensorIn[pSensorIndex()].temp;
    }
    int pReadHumiOut() const{
        return sensorOut[pSensorIndex()].humi;
    }
    int pReadHumiIn() const{
        return sensorIn[pSensorIndex()].humi;
    }
    int pReadWindOut() const{
        return sensorOut[pSensorIndex()].wind;
    }
    int pReadPressIn() const{
        return sensorIn[pSensorIndex()].press;
    }
    eActorIndex pActorIndex() const{
        return indexActor;
    }
    void pActorIndexSet(eActorIndex val){
        indexActor = val;
    }
    uint16_t pActorDataGet(){
        return actor[pActorIndex()].data;
    }
    uint16_t pActorStatusGet(){
        return actor[pActorIndex()].status;
    }
    void pActorDataSet(uint16_t data){
        actor[pActorIndex()].data = data;
    }
    void pActorStatusSet(uint16_t status){
        actor[pActorIndex()].status = status;
    }



public slots:
    //Slots

};

#endif // MODEL_H
