/********************************************************************
 * file:  comnodes.cpp
 * brief: source file for handling the bus communication
 * info:  None
 ********************************************************************/
#include "com.h"

/*********************************************************************
* method: ComNodes
* brief:  Constructor of the ComNodes Object
* params: NONE
*********************************************************************/
Com::Com(QObject *parent) : QObject(parent)
{
    myHal = new Hal();
    myCalcs = new Calcs();

    rs485status = RS485_IDLE;
    rxIndexPending = 0;
    txIndexPending = 0;
    rxIndexDone = 0;
    txIndexDone = 0;

    errorCounterCrc = 0;
    errorCounterBus = 0;

    errorCntTimeOut = 0;
    errorCntCrc = 0;

    myHal->setupGpio(nENARX, IOOUT);
    myHal->clrGpio(nENARX);

    myHal->setupGpio(ENATX, IOOUT);
    myHal->clrGpio(ENATX);

    myHal->setupUart(57600);
    myHal->flushUart();
    setup485RX();

    timerRS485Com = new QTimer(this);
    connect(timerRS485Com, SIGNAL(timeout()),this,SLOT(comRS485TimerTrigger()));
    timerRS485Com->start(50);

    indoorTemp = 0;
    outdoorTemp = 0;
    indoorHumi = 0;
    outdoorHumi = 0;
    indoorPress = 0;
    outdoorPress = 0;
    windSpeed = 0;
}
/*********************************************************************
* method: setup485TX
* brief:  setup RS485 device into TX mode
* params: NONE
*********************************************************************/
void Com::setup485TX()
{
     myHal->setGpio(nENARX);
     myHal->setGpio(ENATX);
}
/*********************************************************************
* method: setup485TX
* brief:  setup RS485 device into RX mode
* params: NONE
*********************************************************************/
void Com::setup485RX()
{
     myHal->clrGpio(nENARX);
     myHal->clrGpio(ENATX);
}
/*********************************************************************
* method: requestOutdoorData
* brief:  requestOutdoorData from outdoor located sensor device
* params: sensorID
*********************************************************************/
void Com::requestOutdoorData(uint8_t sensorID)
{
    unsigned int crc;
    txBuffer[txIndexPending][0] = ADR_OUTDOOR;
    txBuffer[txIndexPending][1] = sensorID;
    txBuffer[txIndexPending][2] = GET_DATA_OUTDOOR;
    crc = myCalcs->crc16_CCITT(&txBuffer[txIndexPending][0], 3);
    txBuffer[txIndexPending][3] = static_cast<unsigned char>(crc>>8);
    txBuffer[txIndexPending][4] = static_cast<unsigned char>(crc);
    txBuffer[txIndexPending][15] = 5;//len indication
    txIndexPending = (txIndexPending+1)&0x0F;
}
/*********************************************************************
* method: requestIndoorData
* brief:  requestIndoorData from indoor located sensor device
* params: sensorID
*********************************************************************/
void Com::requestIndoorData(uint8_t sensorID)
{
    unsigned int crc;
    txBuffer[txIndexPending][0] = ADR_INDOOR;
    txBuffer[txIndexPending][1] = sensorID;
    txBuffer[txIndexPending][2] = GET_DATA_INDOOR;
    crc = myCalcs->crc16_CCITT(&txBuffer[txIndexPending][0], 3);
    txBuffer[txIndexPending][3] = static_cast<unsigned char>(crc>>8);
    txBuffer[txIndexPending][4] = static_cast<unsigned char>(crc);
    txBuffer[txIndexPending][15] = 5;//len indication
    txIndexPending = (txIndexPending+1)&0x0F;
}
/*********************************************************************
* method: requestIndoorData
* brief:  requestIndoorData from indoor located sensor device
* params: actorID
*********************************************************************/
void Com::setActorContent(eActorIndex actorID, uint16_t data, eActorCmdType cmd)
{
    unsigned int crc;
    txBuffer[txIndexPending][0] = ADR_ACTOR;
    txBuffer[txIndexPending][1] = static_cast<unsigned char>(actorID);
    txBuffer[txIndexPending][2] = static_cast<unsigned char>(cmd);
    txBuffer[txIndexPending][3] = static_cast<unsigned char>(data>>8);
    txBuffer[txIndexPending][4] = static_cast<unsigned char>(data);
    crc = myCalcs->crc16_CCITT(&txBuffer[txIndexPending][0], 5);
    txBuffer[txIndexPending][5] = static_cast<unsigned char>(crc>>8);
    txBuffer[txIndexPending][6] = static_cast<unsigned char>(crc);
    txBuffer[txIndexPending][15] = 7;//len indication
    txIndexPending = (txIndexPending+1)&0x0F;
}
/*********************************************************************
* method: comRS485TimerTrigger
* brief:  Triggers as soon as the rs485 timer expires.
*         Indicates to check for Rxed rs485 data
*         Uart data is read and analyzed by the protocolHandler
* params: NONE
*********************************************************************/
void Com::comRS485TimerTrigger()
{
    int16_t val;
    uint16_t crc;
    timerRS485Com->stop();
    switch(rs485status)
    {
        case RS485_IDLE:
            //check for pending data to be txed
            if(txIndexPending!=txIndexDone)
            {
                rs485status = RS485_BUSYTX;
                setup485TX();
                myHal->writeUart(txBuffer[txIndexDone][15], &txBuffer[txIndexDone][0]);                
                timerRS485Com->start(5);
            }
            else
            {
                timerRS485Com->start(50);
            }
        break;
        case RS485_BUSYTX:
            //TX done -> Await response / Dummy state never entered
            rs485status = RS485_BUSYRX;
            setup485RX();
            timerRS485Com->start(15);
        break;
        case RS485_BUSYRX:
            //RX should be present -> check for correctness
            uint16_t indexVal = txBuffer[txIndexDone][0];
            val = static_cast<int16_t>(myHal->dataUartRxed());//result resides in uart rx buffer where as val contains number of rxed data
            if(!((val==-1) || (val==0)))//got some data
            {
                myHal->readUart(&rxBuffer[rxIndexPending][0],static_cast<uint8_t>(val));
                crc = checkBusData(&rxBuffer[rxIndexPending][0], static_cast<uint16_t>(val));
                if(crc == 0x0000)
                {
                    rxIndexPending = (rxIndexPending+1)&0x0F;
                    txIndexDone = (txIndexDone+1)&0x0F;
                    protocolHandler();
                    errorCounterCrc = 0;
                    errorCounterBus = 0;
                }
                else
                {
                    qDebug() << "ERROR-> RS485 crc -> TimedOut!";
                    errorCounterCrc++;
                    if(errorCounterCrc == 3)
                    {
                        errorCounterCrc = 0;
                        txIndexDone = (txIndexDone+1)&0x0F;//Node Error go ahead!

                        errorCntCrc++;
                    }

                }
            }
            else
            {
                qDebug() << "ERROR-> RS485 communication -> TimedOut! -> "<< indexVal;
                errorCounterBus++;
                if(errorCounterBus == 3)
                {
                    errorCounterBus = 0;
                    txIndexDone = (txIndexDone+1)&0x0F;//Node Error go ahead!
                    errorCntTimeOut++;
                }
            }
            rs485status = RS485_IDLE;
            timerRS485Com->start(5);
        break;
    }
}
/*********************************************************************
* method: checkBusData
* brief:  Perform CRC check on received data
* params: source pointer ptr and buffer length len
* returns: calculated CRC
*********************************************************************/
uint16_t Com::checkBusData(uint8_t *ptr, uint16_t len)
{
    uint16_t crc;
    crc = myCalcs->crc16_CCITT(ptr, len);
    return crc;
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
void Com::protocolHandler()
{
    uint8_t index;
    index = rxIndexDone;
    if(rxIndexPending!=rxIndexDone)
    {
        switch(rxBuffer[index][0])
        {
            case ADR_OUTDOOR:
                outdoorTemp = static_cast<int16_t>(rxBuffer[index][2]<<8 | rxBuffer[index][3]);
                windSpeed = static_cast<int16_t>(rxBuffer[index][4]<<8 | rxBuffer[index][5]);
                outdoorHumi = static_cast<int16_t>(rxBuffer[index][6]<<8 | rxBuffer[index][7]);
            break;
            case ADR_INDOOR:
                indoorTemp = static_cast<int16_t>(rxBuffer[index][2]<<8 | rxBuffer[index][3]);
                indoorHumi = static_cast<int16_t>(rxBuffer[index][4]<<8 | rxBuffer[index][5]);
                indoorPress = static_cast<int16_t>(rxBuffer[index][6]<<8 | rxBuffer[index][7]);
            break;
            case ADR_ACTOR:
                //nothing to be done... ACK just not analyzed...
            break;
            default:
                qDebug() << "ERROR-> UART communication -> Wrong Protocol!";
            break;
        }
        rxIndexDone = (rxIndexDone + 1)&0x0F;
    }
}
