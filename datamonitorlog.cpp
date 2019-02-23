/********************************************************************
 * file:  datamonitorlog.cpp
 * brief: header file for data and functionality delivered via the
 *        mointorLog-screen
 ********************************************************************/
#include "datamonitorlog.h"
#include "weatherbridge.h"
/*********************************************************************
* method: DataMonitorLog
* brief:  Constructor of the DataMonitorLog Object
*         Creation of all the required Objects
*         Performing all the required configs and connections
* params: diModel, injected model for data handling
*********************************************************************/
DataMonitorLog::DataMonitorLog(QObject *parent, Model* diModel) : QObject(parent)
{
    QTimer *timerLogger = new QTimer(this);
    connect(timerLogger, SIGNAL(timeout()),this,SLOT(logData()));
    timerLogger->start(3600000);
    measIndex = 0;
    minX = 0;
    maxX = 16;
    refMod = diModel;
}
/*********************************************************************
* method: update
* brief:  Performs the updating of the charts by the defined number of
*         entries. Afterwards the signal to update the view is emitted
* params: num, number of entries
*********************************************************************/
void DataMonitorLog::update(int num)
{
    for(int i=0;i<num;i++)
    {
        tempInValue.setX(measIndex);
        tempInValue.setY(3* ( (static_cast<qreal>(measIndex)) / 1024.00 ) );
        tempOutValue.setX(measIndex);
        tempOutValue.setY((measIndex/1024));
        windOutValue.setX(measIndex);
        windOutValue.setY((measIndex/512));
        humiInValue.setX(measIndex);
        humiInValue.setY((measIndex/256));

        measIndex++;


    }
    emit wValueChanged();

}
/*********************************************************************
* method: minXborders
* brief:  Handles the position of the minimum cursor, that represents
*         the left border of the chart.
* params: num, indicates what kind of button is preesed
*           0: move one to the left in case possible
*           1: move 100 to the left in case possible otherwise just one
*           2: move one to the right in case possible
*           else: move 100 to the right in case possible otherwise just one
*********************************************************************/
void DataMonitorLog::minXborders(int num)
{
    switch(num){
        case 0:
            if(minX>0){minX--;}
        break;
        case 1:
            if(minX>100){minX-=100;}
            else{
                if(minX>0){minX--;}
            }
        break;
        case 2:
            if((minX+1)<maxX){minX++;}
        break;
        default:
            if((minX+100)<maxX){minX+=100;}
            else{
                if((minX+1)<maxX){minX++;}
            }
        break;
    }
    emit wScaleChanged();
}
/*********************************************************************
* method: viewFull
* brief:  Handles chart views presentation. The amount of data
*         that is visualized
* params: num, indicates the presented time
*           0: All available data is presented
*           1: Data of the last day is presented
*           2: Data of the last week is presented
*           else: Data of the last month is presented
*********************************************************************/
void DataMonitorLog::viewFull(int num)
{
    switch(num){
        case 0:
            minX = 0;
            maxX = measIndex;
            if(measIndex==0)
            {
               maxX = 1;
            }
        break;
        case 1://last Day
            minX = measIndex - 288;
            if (minX<0){minX=0;}
            maxX = measIndex;
        break;
        case 2://last week
            minX = measIndex - 2016;
            if (minX<0){minX=0;}
            maxX = measIndex;
        break;
        case 3://last month
            minX = measIndex - 8064;
            if (minX<0){minX=0;}
            maxX = measIndex;
        break;
        default:
            minX = 0;
            maxX = measIndex;
            if(measIndex==0)
            {
               maxX = 1;
            }
        break;
    }
    emit wScaleChanged();
}
/*********************************************************************
* method: maxXborders
* brief:  Handles the position of the maximum cursor, that represents
*         the right border of the chart.
* params: num, indicates what kind of button is preesed
*           0: move one to the left in case possible
*           1: move 100 to the left in case possible otherwise just one
*           2: move one to the right in case possible
*           else: move 100 to the right in case possible otherwise just one
*********************************************************************/
void DataMonitorLog::maxXborders(int num)
{
    switch(num){
        case 0:
            if((maxX)>(minX+1)){maxX--;}
        break;
        case 1:
            if((maxX)>(minX+100)){maxX-=100;}
            else{
                if((maxX)>(minX+1)){maxX--;}
            }
        break;
        case 2:
            maxX++;
        break;
        default:
            maxX+=100;
        break;
    }
    emit wScaleChanged();
}










void DataMonitorLog::logData()
{

}
