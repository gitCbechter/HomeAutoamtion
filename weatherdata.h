#ifndef WEATHERDATA_H
#define WEATHERDATA_H

#include <QObject>

class WeatherData
{
public:
    WeatherData();
    double maxTemp;
    double minTemp;
    double windSpeed;
    double windDir;
    double rainLitre;
    double snow;
    double humidity;
    double pressure;
    int cloudiness;
    QString dateInfo;
    QString iconId;
};

#endif // WEATHERDATA_H
