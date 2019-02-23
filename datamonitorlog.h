/********************************************************************
 * file:  datamonitorlog.h
 * brief: header file for data and functionality delivered via the
 *        mointorLog-screen
 ********************************************************************/
#ifndef DATAMONITORLOG_H
#define DATAMONITORLOG_H
/*********************************************************************
*Includes
*********************************************************************/
#include <QObject>
#include <QTimer>
#include <QtNetwork>
#include <QDebug>
#include <QDate>
#include <QTime>
#include <QFile>
#include <QtCharts/QXYSeries>
#include <QtCharts/QAreaSeries>
#include <QtCharts/QAbstractSeries>
#include "model.h"
/*********************************************************************
*Defines & Enums
*********************************************************************/
/*********************************************************************
*Classes & Structs
*********************************************************************/
class DataMonitorLog : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QPointF pTempOutValue READ pTempOutValue NOTIFY wValueChanged)
    Q_PROPERTY(QPointF pTempInValue READ pTempInValue NOTIFY wValueChanged)
    Q_PROPERTY(QPointF pWindOutValue READ pWindOutValue NOTIFY wValueChanged)
    Q_PROPERTY(QPointF pHumiInValue READ pHumiInValue NOTIFY wValueChanged)
    Q_PROPERTY(int pMeasIndex READ pReadMeasIndex WRITE pWriteMeasIndex)
    Q_PROPERTY(qreal pMinX READ pReadMinX WRITE pWriteMinX NOTIFY wScaleChanged)
    Q_PROPERTY(qreal pMaxX READ pReadMaxX WRITE pWriteMaxX NOTIFY wScaleChanged)
public:
    explicit DataMonitorLog(QObject *parent = nullptr, Model *diMod = nullptr);
    Model *refMod; //the global and generic model objects reference
    //members controlling the X-Axis of the chart view
    int measIndex;
    qreal minX;
    qreal maxX;
    //Values donating entries to the chart view
    QPointF tempOutValue;
    QPointF tempInValue;
    QPointF windOutValue;
    QPointF humiInValue;

    QPointF pTempOutValue() const{
        return tempOutValue;
    }
    QPointF pTempInValue() const{
        return tempInValue;
    }
    QPointF pWindOutValue() const{
        return windOutValue;
    }
    QPointF pHumiInValue() const{
        return humiInValue;
    }
    int pReadMeasIndex() const{
        return measIndex;
    }
    void pWriteMeasIndex(int val){
        measIndex = val;
    }
    qreal pReadMinX() const{
        return minX;
    }
    void pWriteMinX(qreal val){
        minX = val;
    }
    qreal pReadMaxX() const{
        return maxX;
    }
    void pWriteMaxX(qreal val){
        maxX = val;
    }
signals:
    void wValueChanged();
    void wScaleChanged();
public slots:
    void logData();
    void update(int num);
    void minXborders(int num);
    void maxXborders(int num);
    void viewFull(int num);
};

#endif // DATAMONITORLOG_H
