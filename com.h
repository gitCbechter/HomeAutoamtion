/********************************************************************
 * file:  com.cpp
 * brief: source file for handling the bus communication
 ********************************************************************/
#ifndef COM_H
#define COM_H
/*********************************************************************
*Includes
*********************************************************************/
#include <QObject>
#include <QTimer>
#include <QtNetwork>
#include <QDebug>
#include <QDate>
#include <QTime>
#include "hal.h"
#include "calcs.h"

/*********************************************************************
*Defines & Enums
*********************************************************************/
#define ADR_INDOOR           0x01
#define ADR_OUTDOOR          0x02
#define ADR_ACTOR            0x03

#define GET_DATA_INDOOR     0x00
#define GET_DATA_OUTDOOR    0x01

#define GET_COMMAND_ACK     0x00

#define ZIP_SLEEPING        0x0001
#define ZIP_PRINCESS        0x0002
#define ZIP_MESSY           0x0004
#define ZIP_ALL             0x0007

#define JAL_ALL             0x0007
#define JAL_TERRACE         0x0001
#define JAL_EATING          0x0002
#define JAL_LIVING          0x0004

#define SW_HUT              0x0001
#define SW_PUMP             0x0002
#define SW_WIN              0x0003





enum eRS485State {RS485_IDLE=0, RS485_BUSYTX=1, RS485_BUSYRX=2};

enum eSensorIndex {SENSOR_0 = 0, SENSOR_1 = 1, SENSOR_2 = 2, SENSOR_3 = 3};
enum eActorIndex {ACTOR_GEN = 0, ACTOR_ZIP = 1, ACTOR_JAL = 2, ACTOR_INDOOR = 3, ACTOR_OUTDOOR = 4};
enum eActorCmdType {ZIPUP_CMD = 0, JALUP_CMD = 1, LAMUP_CMD = 2, ACTON_CMD = 3, ZIPDWN_CMD = 4, JALDWN_CMD = 5, LAMDWN_CMD = 6, ACTOFF_CMD = 7, ZIPSTOP_CMD = 8, JALSTOP_CMD = 9, JALLAMTIME_CMD = 10, ACTOPEN_CMD = 11, ACTCLOSE_CMD = 12};

/*********************************************************************
*Classes & Structs
*********************************************************************/
class Com : public QObject
{
    Q_OBJECT
public:
    explicit Com(QObject *parent = nullptr);

    void setup485TX();
    void setup485RX();
    void requestOutdoorData(uint8_t sensorID);
    void requestIndoorData(uint8_t sensorID);
    void setActorContent(eActorIndex actorID, uint16_t data, eActorCmdType cmd);
    int getBusData(uint8_t *ptr);
    uint16_t checkBusData(uint8_t *ptr, uint16_t len);
    void protocolHandler();

    Hal *myHal;
    Calcs *myCalcs;

    int16_t indoorTemp;
    int16_t outdoorTemp;
    int16_t indoorHumi;
    int16_t outdoorHumi;
    int16_t indoorPress;
    int16_t outdoorPress;
    int16_t windSpeed;

    uint8_t txBuffer[16][16];
    uint8_t rxBuffer[16][16];
    uint8_t txIndexPending;
    uint8_t txIndexDone;
    uint8_t rxIndexPending;
    uint8_t rxIndexDone;
    uint8_t errorCounterCrc;
    uint8_t errorCounterBus;

    uint32_t errorCntTimeOut;
    uint32_t errorCntCrc;

    eRS485State rs485status;

    QTimer *timerRS485Com; //Timer for handling the RS485 communication control flow
    QTimer *timerOut;  //Timer for handling RS485 communication timeouts






signals:

public slots:
    void comRS485TimerTrigger();
};

#endif // COM_H
