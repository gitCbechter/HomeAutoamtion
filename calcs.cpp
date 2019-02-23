/********************************************************************
 * file:  calcs.cpp
 * brief: source file for calculations supporting things
 * info:  None
 ********************************************************************/
#include "calcs.h"
/*********************************************************************
* method: Hal
* brief:  Constructor of the Calcs Object
* params: NONE
*********************************************************************/
Calcs::Calcs()
{

}
/*********************************************************************
* method: crc16_CCITT
* brief:  Generate the CRC16 checksum for the given data.
*         CRC-16-CCITT checksum with the generator polynomial 0x1021 and initial value 0xFFFF
* params: len, numbers of bytes to be CRC checked
*         data, ptr to data array holding the data to be checked
*********************************************************************/
uint16_t Calcs::crc16_CCITT(unsigned char *data, uint16_t len)
{
    uint16_t i,crc;
    crc = 0xFFFF;
    for(i=0;i<len;i++)
    {
        crc = ((crc<<8)&0xff00) ^ crc16LUT[((crc>>8)&0xff)^*data++];
    }
    return crc;
}
/*********************************************************************
* method: valTemp2String
* brief:  Converts the 16 bit Temperature value to a QString.
*         Rule is based on the NTC LUT and Aref of the uC handling the sensor
* params: tempVal, ADC val represnting the temperature value
*********************************************************************/
QString Calcs::valTemp2String(int tempVal)
{
    qreal tmp = static_cast<qreal>(tempVal)/100;
    QString text = QString::number(tmp, 'f', 2);
    return text;
}
/*********************************************************************
* method: valWind2String
* brief:  Converts the 16 bit WindSpeed value to a QString.
*         Rule is based on TBD
* params: windVal, ADC val represnting the wind speed value
*********************************************************************/
QString Calcs::valWind2String(int windVal)
{
    qreal tmp = static_cast<qreal>(windVal)/100;
    QString text = QString::number(tmp, 'f', 2);
    return text;
}
/*********************************************************************
* method: valHumi2String
* brief:  Converts the 16 bit Humidity value to a QString.
*         Rule is based on TBD
* params: windVal, ADC val represnting the humidity value
*********************************************************************/
QString Calcs::valHumi2String(int humiVal)
{
    qreal tmp = static_cast<qreal>(humiVal)/100;
    QString text = QString::number(tmp, 'f', 2);
    return text;
}
/*********************************************************************
* method: valPress2String
* brief:  Converts the 16 bit Pressure value to a QString.
*         Rule is based on TBD
* params: pressVal, ADC val represnting the pressure value
*********************************************************************/
QString Calcs::valPress2String(int pressVal)
{
    qreal tmp = static_cast<qreal>(pressVal)/100;
    QString text = QString::number(tmp, 'f', 2);
    return text;
}


