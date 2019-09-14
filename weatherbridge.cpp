/********************************************************************
 * file:  weatherbridge.cpp
 * brief: header file for data and functionality delivered via the
 *        weatherforecast slide-view-screen
 ********************************************************************/
#include "weatherbridge.h"
/*********************************************************************
* method: WeatherBridge
* brief:  Constructor of the WeatherBridge Object
*         Creation of all the required Objects
*         Performing all the required configs and connections
* params: diModel, injected model for data handling
*********************************************************************/
WeatherBridge::WeatherBridge(QObject *parent, Model* diModel) : QObject(parent)
{
    QTimer *timerWeather = new QTimer(this);
    connect(timerWeather, SIGNAL(timeout()),this,SLOT(weatherUpdating()));
    timerWeather->start(600000);
    refMod = diModel;
    manager = new QNetworkAccessManager();
    connect(manager, SIGNAL(finished(QNetworkReply*)),this, SLOT(weatherFinished(QNetworkReply*)));
    //request.setUrl(QUrl("http://api.openweathermap.org/data/2.5/forecast?q=Memmingen&units=metric&APPID=6becf9e45033d108b9b4195ecafad4ff"));
    request.setUrl(QUrl("http://api.openweathermap.org/data/2.5/forecast?lat=48.094433&lon=10.1523967&units=metric&APPID=6becf9e45033d108b9b4195ecafad4ff"));
    manager->get(request);
}
/*********************************************************************
* method: weatherUpdating
* brief:  Performs a request for getting the updated weather info
*         Important is to have the key for do the request @openweathermap
* params: None
*********************************************************************/
void WeatherBridge::weatherUpdating()
{
    qDebug() << "Do a Weather Forecast update";

    request.setUrl(QUrl("http://api.openweathermap.org/data/2.5/forecast?lat=48.094433&lon=10.1523967&units=metric&APPID=6becf9e45033d108b9b4195ecafad4ff"));
    //request.setUrl(QUrl("http://api.openweathermap.org/data/2.5/forecast?q=Memmingen&units=metric&APPID=6becf9e45033d108b9b4195ecafad4ff"));
    //request.setUrl(QUrl("http://api.openweathermap.org/data/2.5/forecast?zip=20095,de&units=metric&APPID=6becf9e45033d108b9b4195ecafad4ff"));
    manager->get(request);



}
/*********************************************************************
* method: getLatestTempMaxFcData
* brief:  Get latest Maximum Temperature Value form the web information
* params: None
* return: Maximum temperature in next three hours
*********************************************************************/
qreal WeatherBridge::getLatestTempMaxFcData()
{
    return currentForeCast.maxTemp;
}
/*********************************************************************
* method: getLatestTempMinFcData
* brief:  Get latest Minimum Temperature Value form the web information
* params: None
* return: Minimum temperature in next three hours
*********************************************************************/
qreal WeatherBridge::getLatestTempMinFcData()
{
    return currentForeCast.minTemp;
}
/*********************************************************************
* method: getLatestWindSpeedFcData
* brief:  Get latest Wind Speed Value form the web information
* params: None
* return: Wind Speed Value in next three hours
*********************************************************************/
qreal WeatherBridge::getLatestWindSpeedFcData()
{
    return currentForeCast.windSpeed;
}
/*********************************************************************
* method: getLatestWindDirFcData
* brief:  Get latest Wind Direction Value form the web information
* params: None
* return: Wind Direction Value in next three hours
*********************************************************************/
qreal WeatherBridge::getLatestWindDirFcData()
{
    return currentForeCast.windDir;
}
/*********************************************************************
* method: getLatestHumidityFcData
* brief:  Get latest Humidity Value form the web information
* params: None
* return: Humidity Value in next three hours
*********************************************************************/
qreal WeatherBridge::getLatestHumidityFcData()
{
    return currentForeCast.humidity;
}
/*********************************************************************
* method: getLatestPressureFcData
* brief:  Get latest Air Pressure Value form the web information
* params: None
* return: Air Pressure Value in next three hours
*********************************************************************/
qreal WeatherBridge::getLatestPressureFcData()
{
    return currentForeCast.pressure;
}
/*********************************************************************
* method: weatherFinished
* brief:  Update the view for the weather forecast based on the weh request
* params: reply, JSON string from HTTP request holding the weather
*         information to be displayed
*********************************************************************/
void WeatherBridge::weatherFinished(QNetworkReply *reply)
{
    QVector<WeatherData> wds(64);

    qDebug() << "Got the Weather Forecast update";
    int i;

    if (reply->error()) {
        qDebug() << reply->errorString();
        return;
    }

    QString answer = reply->readAll();
    qDebug() << answer;
    QJsonDocument jsonResponse = QJsonDocument::fromJson(answer.toUtf8());

    QJsonObject object = jsonResponse.object();
    QJsonValue values = object.value("list");
    QJsonArray array = values.toArray();
    i = 0;
    foreach (const QJsonValue & v, array)
    {
           wds[i].maxTemp = v.toObject().value("main").toObject().value("temp_max").toDouble();
           wds[i].minTemp = v.toObject().value("main").toObject().value("temp_min").toDouble();
           wds[i].windSpeed = v.toObject().value("wind").toObject().value("speed").toDouble();
           wds[i].windDir = v.toObject().value("wind").toObject().value("deg").toDouble();
           wds[i].snow = v.toObject().value("snow").toObject().value("3h").toDouble();
           wds[i].rainLitre = v.toObject().value("rain").toObject().value("3h").toDouble();
           wds[i].humidity = v.toObject().value("main").toObject().value("humidity").toDouble();
           wds[i].pressure = v.toObject().value("main").toObject().value("pressure").toDouble();
           wds[i].cloudiness = (v.toObject().value("clouds").toObject().value("all").toInt());
           wds[i].iconId = v.toObject().value("weather")[0].toObject().value("icon").toString();
           wds[i].dateInfo = v.toObject().value("dt_txt").toString();


           i++;
    }
    currentForeCast.maxTemp = wds[0].maxTemp;
    currentForeCast.minTemp = wds[0].minTemp;
    currentForeCast.windSpeed = wds[0].windSpeed;
    currentForeCast.windDir = wds[0].windDir;
    currentForeCast.rainLitre = wds[0].rainLitre;
    currentForeCast.humidity = wds[0].humidity;
    currentForeCast.pressure = wds[0].pressure;
    currentForeCast.cloudiness = wds[0].cloudiness;
    currentForeCast.dateInfo = wds[0].dateInfo;
/*
    qDebug() << "maxTemp: " << wds[0].maxTemp;
    qDebug() << "minTemp: " << wds[0].minTemp;
    qDebug() << "windSpeed: " << wds[0].windSpeed;
    qDebug() << "snow: " << wds[0].snow;
    qDebug() << "rainLitre: " << wds[0].rainLitre;
    qDebug() << "humidity: " << wds[0].humidity;
    qDebug() << "pressure: " << wds[0].pressure;
    qDebug() << "cloudiness: " << wds[0].cloudiness;
    qDebug() << "iconId: " << wds[3].iconId;
    qDebug() << "dateInfo: " << wds[0].dateInfo;
*/
    for(int j=0;j<8;j++)
    {
        qDebug() << "maxTemp: " << j << " - " << wds[j].maxTemp;
        qDebug() << "minTemp: " << j << " - " << wds[j].minTemp;
    }
    double maxTemp = 0;
    double minTemp = 0;
    double maxWindSpeed = 0;
    double minWindSpeed = 0;
    double maxRain = 0;
    for(int j=0;j<25;j++)
    {
        if (wds[j].maxTemp>maxTemp)
        {
            maxTemp = ceil(wds[j].maxTemp);
            if(static_cast<int16_t>(maxTemp)%2!=0)
            {
                if(maxTemp>0)
                {
                    maxTemp++;
                }
                else
                {
                    maxTemp--;
                }
            }
        }
        if (wds[j].minTemp<minTemp)
        {
            minTemp = floor(wds[j].minTemp);
            if(static_cast<int16_t>(minTemp)%2!=0)
            {
                if(minTemp>0)
                {
                    minTemp++;
                }
                else
                {
                    minTemp--;
                }
            }
        }
        if (wds[j].windSpeed>maxWindSpeed)
        {
            maxWindSpeed = ceil(wds[j].windSpeed);
            if(static_cast<int16_t>(maxWindSpeed)%2!=0)
            {
                maxWindSpeed++;
            }
        }
        if (wds[j].windSpeed<minWindSpeed)
        {
            minWindSpeed =floor(wds[j].windSpeed);
        }
        if (wds[j].rainLitre>maxRain)
        {
            maxRain = ceil(wds[j].rainLitre);
            //if (maxRain > 5){maxRain = 10;}
            //if (maxRain > 10) {maxRain = 20;}

        }

    }

    sendRanges(maxTemp, minTemp, maxWindSpeed, minWindSpeed, maxRain);
    sendWeatherData0(wds[0].maxTemp, wds[0].minTemp, wds[0].windSpeed, wds[0].snow, wds[0].rainLitre, wds[0].humidity, wds[0].pressure, wds[0].cloudiness, wds[0].iconId, wds[0].dateInfo);

    sendWeatherData1(wds[1].maxTemp, wds[1].minTemp, wds[1].windSpeed, wds[1].snow, wds[1].rainLitre, wds[1].humidity, wds[1].pressure, wds[1].cloudiness, wds[1].iconId, wds[1].dateInfo);
    sendWeatherData2(wds[2].maxTemp, wds[2].minTemp, wds[2].windSpeed, wds[2].snow, wds[2].rainLitre, wds[2].humidity, wds[2].pressure, wds[2].cloudiness, wds[2].iconId, wds[2].dateInfo);
    sendWeatherData3(wds[3].maxTemp, wds[3].minTemp, wds[3].windSpeed, wds[3].snow, wds[3].rainLitre, wds[3].humidity, wds[3].pressure, wds[3].cloudiness, wds[3].iconId, wds[3].dateInfo);
    sendWeatherData4(wds[4].maxTemp, wds[4].minTemp, wds[4].windSpeed, wds[4].snow, wds[4].rainLitre, wds[4].humidity, wds[4].pressure, wds[4].cloudiness, wds[4].iconId, wds[4].dateInfo);
    sendWeatherData5(wds[5].maxTemp, wds[5].minTemp, wds[5].windSpeed, wds[5].snow, wds[5].rainLitre, wds[5].humidity, wds[5].pressure, wds[5].cloudiness, wds[5].iconId, wds[5].dateInfo);
    sendWeatherData6(wds[6].maxTemp, wds[6].minTemp, wds[6].windSpeed, wds[6].snow, wds[6].rainLitre, wds[6].humidity, wds[6].pressure, wds[6].cloudiness, wds[6].iconId, wds[6].dateInfo);
    sendWeatherData7(wds[7].maxTemp, wds[7].minTemp, wds[7].windSpeed, wds[7].snow, wds[7].rainLitre, wds[7].humidity, wds[7].pressure, wds[7].cloudiness, wds[7].iconId, wds[7].dateInfo);
    sendWeatherData8(wds[8].maxTemp, wds[8].minTemp, wds[8].windSpeed, wds[8].snow, wds[8].rainLitre, wds[8].humidity, wds[8].pressure, wds[8].cloudiness, wds[8].iconId, wds[8].dateInfo);
    sendWeatherData9(wds[9].maxTemp, wds[9].minTemp, wds[9].windSpeed, wds[9].snow, wds[9].rainLitre, wds[9].humidity, wds[9].pressure, wds[9].cloudiness, wds[9].iconId, wds[9].dateInfo);
    sendWeatherData10(wds[10].maxTemp, wds[10].minTemp, wds[10].windSpeed, wds[10].snow, wds[10].rainLitre, wds[10].humidity, wds[10].pressure, wds[10].cloudiness, wds[10].iconId, wds[10].dateInfo);
    sendWeatherData11(wds[11].maxTemp, wds[11].minTemp, wds[11].windSpeed, wds[11].snow, wds[11].rainLitre, wds[11].humidity, wds[11].pressure, wds[11].cloudiness, wds[11].iconId, wds[11].dateInfo);
    sendWeatherData12(wds[12].maxTemp, wds[12].minTemp, wds[12].windSpeed, wds[12].snow, wds[12].rainLitre, wds[12].humidity, wds[12].pressure, wds[12].cloudiness, wds[12].iconId, wds[12].dateInfo);
    sendWeatherData13(wds[13].maxTemp, wds[13].minTemp, wds[13].windSpeed, wds[13].snow, wds[13].rainLitre, wds[13].humidity, wds[13].pressure, wds[13].cloudiness, wds[13].iconId, wds[13].dateInfo);
    sendWeatherData14(wds[14].maxTemp, wds[14].minTemp, wds[14].windSpeed, wds[14].snow, wds[14].rainLitre, wds[14].humidity, wds[14].pressure, wds[14].cloudiness, wds[14].iconId, wds[14].dateInfo);
    sendWeatherData15(wds[15].maxTemp, wds[15].minTemp, wds[15].windSpeed, wds[15].snow, wds[15].rainLitre, wds[15].humidity, wds[15].pressure, wds[15].cloudiness, wds[15].iconId, wds[15].dateInfo);
    sendWeatherData16(wds[16].maxTemp, wds[16].minTemp, wds[16].windSpeed, wds[16].snow, wds[16].rainLitre, wds[16].humidity, wds[16].pressure, wds[16].cloudiness, wds[16].iconId, wds[16].dateInfo);
    sendWeatherData17(wds[17].maxTemp, wds[17].minTemp, wds[17].windSpeed, wds[17].snow, wds[17].rainLitre, wds[17].humidity, wds[17].pressure, wds[17].cloudiness, wds[17].iconId, wds[17].dateInfo);
    sendWeatherData18(wds[18].maxTemp, wds[18].minTemp, wds[18].windSpeed, wds[18].snow, wds[18].rainLitre, wds[18].humidity, wds[18].pressure, wds[18].cloudiness, wds[18].iconId, wds[18].dateInfo);
    sendWeatherData19(wds[19].maxTemp, wds[19].minTemp, wds[19].windSpeed, wds[19].snow, wds[19].rainLitre, wds[19].humidity, wds[19].pressure, wds[19].cloudiness, wds[19].iconId, wds[19].dateInfo);
    sendWeatherData20(wds[20].maxTemp, wds[20].minTemp, wds[20].windSpeed, wds[20].snow, wds[20].rainLitre, wds[20].humidity, wds[20].pressure, wds[20].cloudiness, wds[20].iconId, wds[20].dateInfo);
    sendWeatherData21(wds[21].maxTemp, wds[21].minTemp, wds[21].windSpeed, wds[21].snow, wds[21].rainLitre, wds[21].humidity, wds[21].pressure, wds[21].cloudiness, wds[21].iconId, wds[21].dateInfo);
    sendWeatherData22(wds[22].maxTemp, wds[22].minTemp, wds[22].windSpeed, wds[22].snow, wds[22].rainLitre, wds[22].humidity, wds[22].pressure, wds[22].cloudiness, wds[22].iconId, wds[22].dateInfo);
    sendWeatherData23(wds[23].maxTemp, wds[23].minTemp, wds[23].windSpeed, wds[23].snow, wds[23].rainLitre, wds[23].humidity, wds[23].pressure, wds[23].cloudiness, wds[23].iconId, wds[23].dateInfo);
    sendWeatherData24(wds[24].maxTemp, wds[24].minTemp, wds[24].windSpeed, wds[24].snow, wds[24].rainLitre, wds[24].humidity, wds[24].pressure, wds[24].cloudiness, wds[24].iconId, wds[24].dateInfo);
}

