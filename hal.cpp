/********************************************************************
 * file:  hal.cpp
 * brief: source file for hardware abstractions layer
 * info:  - make sure to have the serial interface remapped (/boot/config.txt)
 *          dtoverlay=pi3-disable-bt
 *        - Install wiringPi Library, in case of cross compiling copy libs from RPI to host
 *        - Add the lib to Qt .pro file
 *          LIBS += -L/usr/local/lib -lwiringPi
 ********************************************************************/
#include "hal.h"
/*********************************************************************
* method: Hal
* brief:  Constructor of the Hal Object
*         Basic init of the wiringPi Library
* params: NONE
*********************************************************************/
Hal::Hal()
{
    wiringPiSetup();
}
/*********************************************************************
* method: Hal
* brief:  Destructor of the Hal Object
* params: NONE
*********************************************************************/
Hal::~Hal()
{

}
/*********************************************************************
* method: setupGpio
* brief:  Configure the defined RPI IO to be an In or Out pin by a call
*         to the wiringPi - Library method pinMode
* params: name: eGpio enum defined IO location
*         dir: eIoType defined direction
*********************************************************************/
void Hal::setupGpio(eGpio name, eIoType dir)
{
    pinMode(static_cast<int>(name),static_cast<int>(dir));
}
/*********************************************************************
* method: setGpio
* brief:  Configure the defined RPI IO to be set to logical high by a
*         call to the wiringPi - Library method digitalWrite
* params: name: eGpio enum defined IO location
*********************************************************************/
void Hal::setGpio(eGpio name)
{
    digitalWrite(static_cast<int>(name),IO_HIGH);
}
/*********************************************************************
* method: clrGpio
* brief:  Configure the defined RPI IO to be reset to logical low by a
*         call to the wiringPi - Library method digitalWrite
* params: name: eGpio enum defined IO location
*********************************************************************/
void Hal::clrGpio(eGpio name)
{
    digitalWrite(static_cast<int>(name),IO_LOW);
}
/*********************************************************************
* method: writeGpio
* brief:  Set the defined RPI IO to the desired logical level
* params: name: eGpio enum defined IO location
*         state: the logical level (IO_HIGH/IO_LOW)
*********************************************************************/
void Hal::writeGpio(eGpio name, bool state)
{
    if(state)
    {
        setGpio(name);
    }
    else
    {
        clrGpio(name);
    }
}
/*********************************************************************
* method: readGpio
* brief:  Read the IO status of the desired RPI-IO location by a
*         call to the wiringPi - Library method digitalRead
* params: name: eGpio enum defined IO location
* return: the value (0/1) of the read IO location
*********************************************************************/
int Hal::readGpio(eGpio name)
{
    int val;
    val = static_cast<int>(digitalRead(static_cast<int>(name)));
    return val;
}
/*********************************************************************
* method: setupUart
* brief:  Configure the RPI UART to be used and enabled by a call
*         to the wiringPi - Library method setupUart
*         Used UART is the "/dev/ttyAMA0". Make sure to have this
*         made available by disabling BT and mapping it to the
*         HW-Serial to be used within the QT - C++ implementation
* params: baud: the desired baudrate to be used
*********************************************************************/
int Hal::setupUart(int baud)
{
    if((uartFd = serialOpen ("/dev/ttyS0", baud)) < 0)
    {
        return -1;
    }
    else
    {
        return 0;
    }
}
/*********************************************************************
* method: writeUart
* brief:  Write the UART wr buffer to the serial device. This is done byte
*         per byte. Additionally a CRC is calculated and appended.
* params: len: numbers of bytes to be TXed without CRC
*********************************************************************/
void Hal::writeUart(unsigned char len, unsigned char *src)
{
    unsigned char i;
    unsigned char tmp;
    for(i=0;i<len;i++)
    {
        tmp = *src++;
        serialPutchar (uartFd, tmp);
    }
}
/*********************************************************************
* method: flushUart
* brief:  This discards all data received, or waiting to be send down
*         the given device by a call to the wiringPi - Library method
*         serialFlush
* params: NONE
*********************************************************************/
void Hal::flushUart()
{
    serialFlush(uartFd);
}
/*********************************************************************
* method: closeUart
* brief:  Closes the device identified by the file descriptor given by
*         a call to the wiringPi - Library method serialClose
* params: NONE
*********************************************************************/
void Hal::closeUart()
{
    serialClose(uartFd);
}
/*********************************************************************
* method: dataUartRxed
* brief:  Returns the number of characters available for reading, or
*         -1 for any error condition, in which case errno will be set
*         appropriately. This is done by a call to the
*         wiringPi - Library method dataUartRxed
* params: NONE
*********************************************************************/
int Hal::dataUartRxed()
{
    return serialDataAvail(uartFd);
}
/*********************************************************************
* method: readUart
* brief:  Returns the number of characters read, or -1 for any error
*         condition, in which case errno will be set appropriately.
*         This is done by a call to the  wiringPi - Library method
*         dataUartRxed. Afterwards the data is read byte per byte and
*         stored to the UART rd Buffer
* params: NONE
*********************************************************************/
int Hal::readUart(unsigned char *des, unsigned char len)
{
    unsigned char i;
    //get UART data    
    for(i=0;i<len;i++)
    {
        *des++=static_cast<unsigned char>(serialGetchar(uartFd));
    }
    return len;
}
