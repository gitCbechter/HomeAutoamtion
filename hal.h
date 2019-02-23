/********************************************************************
 * file:  hal.h
 * brief: header file for hardware abstractions layer
 ********************************************************************/
#ifndef HAL_H
#define HAL_H
/*********************************************************************
*Includes
*********************************************************************/
#include "wiringPi.h"
#include "wiringSerial.h"
#include "wiringPiSPI.h"
/*********************************************************************
*Defines & Enums
*********************************************************************/
enum eIoType {IOIN=INPUT,IOOUT=OUTPUT};
enum eGpio {nENARX=27,ENATX=28,ACTOR1=24,ACTOR2=25};
enum eUartState {UART_IDLE=0, UART_BUSYTX=1, UART_BUSYRX=2};
#define IO_HIGH HIGH
#define IO_LOW  LOW
/*********************************************************************
*Classes & Structs
*********************************************************************/
class Hal
{
public:
    //Methods
    Hal();
    ~Hal();
    void setupGpio(eGpio name, eIoType dir);
    void setGpio(eGpio name);
    void clrGpio(eGpio name);
    void writeGpio(eGpio name, bool state);
    int readGpio(eGpio name);
    int setupUart(int baud);
    void writeUart(unsigned char len, unsigned char *src);
    void flushUart();
    void closeUart();
    int dataUartRxed();
    int readUart(unsigned char *des, unsigned char len);
    //Members
    int uartFd; //Uart File Descriptor / Handle to make used of the UART
    eUartState uartState; //status of the UART module

    unsigned char uartRdBuffer[64]; //UART rx buffer
};

#endif // HAL_H
