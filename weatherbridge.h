/********************************************************************
 * file:  weatherbridge.h
 * brief: header file for data and functionality delivered via the
 *        weatherforecast slide-view-screen
 ********************************************************************/
#ifndef WEATHERBRIDGE_H
#define WEATHERBRIDGE_H
/*********************************************************************
*Includes
*********************************************************************/
#include <QObject>
#include <QTimer>
#include <QtNetwork>
#include <QDebug>
#include <QDate>
#include <QTime>
#include "weatherdata.h"
#include "model.h"
/*********************************************************************
*Defines & Enums
*********************************************************************/
/*********************************************************************
*Classes & Structs
*********************************************************************/
class WeatherBridge : public QObject
{
    Q_OBJECT
public:
    explicit WeatherBridge(QObject *parent = nullptr, Model *diMod = nullptr);

    QNetworkAccessManager *manager;//http request manger
    QNetworkRequest request;//http request

    WeatherData currentForeCast;
    qreal getLatestTempMaxFcData();
    qreal getLatestTempMinFcData();
    qreal getLatestWindSpeedFcData();
    qreal getLatestWindDirFcData();
    qreal getLatestHumidityFcData();
    qreal getLatestPressureFcData();

    Model *refMod; //the global and generic model objects reference

signals:
    void sendWeatherData0(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData1(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData2(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData3(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData4(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData5(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData6(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData7(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData8(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData9(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData10(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData11(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData12(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData13(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData14(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData15(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData16(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData17(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData18(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData19(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData20(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData21(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData22(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData23(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendWeatherData24(double maxTemp, double minTemp, double windSpeed, double snow, double rainLitre, double humidity, double pressure, int cloudiness, QString iconId, QString dateInfo);
    void sendRanges(double maxTemp, double minTemp, double maxWindSpeed, double minWindSpeed, double maxRain);

public slots:
    void weatherUpdating();
    void weatherFinished(QNetworkReply *reply);
};

#endif // WEATHERBRIDGE_H
