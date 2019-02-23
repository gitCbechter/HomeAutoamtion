import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0


Item {
    id:root

    Rectangle{
        width: 800
        height: 200
        x:0
        y:0

        antialiasing: false
        color: "Transparent"
        ListView {
                width: parent.width
                height: parent.height
                clip: true
                model: mainModel
                spacing: 110
                orientation: ListView.Horizontal
                //snapMode: ListView.SnapToItem
                //highlightRangeMode: ListView.StrictlyEnforceRange
        }

        VisualItemModel {
            id: mainModel
            ChBeWeatherBox {
                id:myWe1
                Connections {
                    target: weatherbridge
                    onSendWeatherData0: {
                        myWe1.maxTemp = maxTemp;
                        myWe1.minTemp = minTemp;
                        myWe1.windSpeed = windSpeed;
                        myWe1.rainLitre = rainLitre + snow;
                        myWe1.snow = snow;
                        myWe1.humidity = humidity;
                        myWe1.pressure = pressure;
                        myWe1.cloudiness = cloudiness;
                        myWe1.iconId = iconId;
                        myWe1.infoHead = dateInfo;

                    }
                }
            }
            ChBeWeatherBox {
                id:myWe2
                Connections {
                    target: weatherbridge
                    onSendWeatherData1: {
                        myWe2.maxTemp = maxTemp;
                        myWe2.minTemp = minTemp;
                        myWe2.windSpeed = windSpeed;
                        myWe2.rainLitre = rainLitre;
                        myWe2.snow = snow;
                        myWe2.humidity = humidity;
                        myWe2.pressure = pressure;
                        myWe2.cloudiness = cloudiness;
                        myWe2.iconId = iconId;
                        myWe2.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe3
                Connections {
                    target: weatherbridge
                    onSendWeatherData2: {
                        myWe3.maxTemp = maxTemp;
                        myWe3.minTemp = minTemp;
                        myWe3.windSpeed = windSpeed;
                        myWe3.rainLitre = rainLitre;
                        myWe3.snow = snow;
                        myWe3.humidity = humidity;
                        myWe3.pressure = pressure;
                        myWe3.cloudiness = cloudiness;
                        myWe3.iconId = iconId;
                        myWe3.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe4
                Connections {
                    target: weatherbridge
                    onSendWeatherData3: {
                        myWe4.maxTemp = maxTemp;
                        myWe4.minTemp = minTemp;
                        myWe4.windSpeed = windSpeed;
                        myWe4.rainLitre = rainLitre;
                        myWe4.snow = snow;
                        myWe4.humidity = humidity;
                        myWe4.pressure = pressure;
                        myWe4.cloudiness = cloudiness;
                        myWe4.iconId = iconId;
                        myWe4.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe5
                Connections {
                    target: weatherbridge
                    onSendWeatherData4: {
                        myWe5.maxTemp = maxTemp;
                        myWe5.minTemp = minTemp;
                        myWe5.windSpeed = windSpeed;
                        myWe5.rainLitre = rainLitre;
                        myWe5.snow = snow;
                        myWe5.humidity = humidity;
                        myWe5.pressure = pressure;
                        myWe5.cloudiness = cloudiness;
                        myWe5.iconId = iconId;
                        myWe5.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe6
                Connections {
                    target: weatherbridge
                    onSendWeatherData5: {
                        myWe6.maxTemp = maxTemp;
                        myWe6.minTemp = minTemp;
                        myWe6.windSpeed = windSpeed;
                        myWe6.rainLitre = rainLitre;
                        myWe6.snow = snow;
                        myWe6.humidity = humidity;
                        myWe6.pressure = pressure;
                        myWe6.cloudiness = cloudiness;
                        myWe6.iconId = iconId;
                        myWe6.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe7
                Connections {
                    target: weatherbridge
                    onSendWeatherData6: {
                        myWe7.maxTemp = maxTemp;
                        myWe7.minTemp = minTemp;
                        myWe7.windSpeed = windSpeed;
                        myWe7.rainLitre = rainLitre;
                        myWe7.snow = snow;
                        myWe7.humidity = humidity;
                        myWe7.pressure = pressure;
                        myWe7.cloudiness = cloudiness;
                        myWe7.iconId = iconId;
                        myWe7.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe8
                Connections {
                    target: weatherbridge
                    onSendWeatherData7: {
                        myWe8.maxTemp = maxTemp;
                        myWe8.minTemp = minTemp;
                        myWe8.windSpeed = windSpeed;
                        myWe8.rainLitre = rainLitre;
                        myWe8.snow = snow;
                        myWe8.humidity = humidity;
                        myWe8.pressure = pressure;
                        myWe8.cloudiness = cloudiness;
                        myWe8.iconId = iconId;
                        myWe8.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe9
                Connections {
                    target: weatherbridge
                    onSendWeatherData8: {
                        myWe9.maxTemp = maxTemp;
                        myWe9.minTemp = minTemp;
                        myWe9.windSpeed = windSpeed;
                        myWe9.rainLitre = rainLitre;
                        myWe9.snow = snow;
                        myWe9.humidity = humidity;
                        myWe9.pressure = pressure;
                        myWe9.cloudiness = cloudiness;
                        myWe9.iconId = iconId;
                        myWe9.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe10
                Connections {
                    target: weatherbridge
                    onSendWeatherData9: {
                        myWe10.maxTemp = maxTemp;
                        myWe10.minTemp = minTemp;
                        myWe10.windSpeed = windSpeed;
                        myWe10.rainLitre = rainLitre;
                        myWe10.snow = snow;
                        myWe10.humidity = humidity;
                        myWe10.pressure = pressure;
                        myWe10.cloudiness = cloudiness;
                        myWe10.iconId = iconId;
                        myWe10.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe11
                Connections {
                    target: weatherbridge
                    onSendWeatherData10: {
                        myWe11.maxTemp = maxTemp;
                        myWe11.minTemp = minTemp;
                        myWe11.windSpeed = windSpeed;
                        myWe11.rainLitre = rainLitre;
                        myWe11.snow = snow;
                        myWe11.humidity = humidity;
                        myWe11.pressure = pressure;
                        myWe11.cloudiness = cloudiness;
                        myWe11.iconId = iconId;
                        myWe11.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe12
                Connections {
                    target: weatherbridge
                    onSendWeatherData11: {
                        myWe12.maxTemp = maxTemp;
                        myWe12.minTemp = minTemp;
                        myWe12.windSpeed = windSpeed;
                        myWe12.rainLitre = rainLitre;
                        myWe12.snow = snow;
                        myWe12.humidity = humidity;
                        myWe12.pressure = pressure;
                        myWe12.cloudiness = cloudiness;
                        myWe12.iconId = iconId;
                        myWe12.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe13
                Connections {
                    target: weatherbridge
                    onSendWeatherData12: {
                        myWe13.maxTemp = maxTemp;
                        myWe13.minTemp = minTemp;
                        myWe13.windSpeed = windSpeed;
                        myWe13.rainLitre = rainLitre;
                        myWe13.snow = snow;
                        myWe13.humidity = humidity;
                        myWe13.pressure = pressure;
                        myWe13.cloudiness = cloudiness;
                        myWe13.iconId = iconId;
                        myWe13.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe14
                Connections {
                    target: weatherbridge
                    onSendWeatherData13: {
                        myWe14.maxTemp = maxTemp;
                        myWe14.minTemp = minTemp;
                        myWe14.windSpeed = windSpeed;
                        myWe14.rainLitre = rainLitre;
                        myWe14.snow = snow;
                        myWe14.humidity = humidity;
                        myWe14.pressure = pressure;
                        myWe14.cloudiness = cloudiness;
                        myWe14.iconId = iconId;
                        myWe14.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe15
                Connections {
                    target: weatherbridge
                    onSendWeatherData14: {
                        myWe15.maxTemp = maxTemp;
                        myWe15.minTemp = minTemp;
                        myWe15.windSpeed = windSpeed;
                        myWe15.rainLitre = rainLitre;
                        myWe15.snow = snow;
                        myWe15.humidity = humidity;
                        myWe15.pressure = pressure;
                        myWe15.cloudiness = cloudiness;
                        myWe15.iconId = iconId;
                        myWe15.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe16
                Connections {
                    target: weatherbridge
                    onSendWeatherData15: {
                        myWe16.maxTemp = maxTemp;
                        myWe16.minTemp = minTemp;
                        myWe16.windSpeed = windSpeed;
                        myWe16.rainLitre = rainLitre;
                        myWe16.snow = snow;
                        myWe16.humidity = humidity;
                        myWe16.pressure = pressure;
                        myWe16.cloudiness = cloudiness;
                        myWe16.iconId = iconId;
                        myWe16.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe17
                Connections {
                    target: weatherbridge
                    onSendWeatherData16: {
                        myWe17.maxTemp = maxTemp;
                        myWe17.minTemp = minTemp;
                        myWe17.windSpeed = windSpeed;
                        myWe17.rainLitre = rainLitre;
                        myWe17.snow = snow;
                        myWe17.humidity = humidity;
                        myWe17.pressure = pressure;
                        myWe17.cloudiness = cloudiness;
                        myWe17.iconId = iconId;
                        myWe17.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe18
                Connections {
                    target: weatherbridge
                    onSendWeatherData17: {
                        myWe18.maxTemp = maxTemp;
                        myWe18.minTemp = minTemp;
                        myWe18.windSpeed = windSpeed;
                        myWe18.rainLitre = rainLitre;
                        myWe18.snow = snow;
                        myWe18.humidity = humidity;
                        myWe18.pressure = pressure;
                        myWe18.cloudiness = cloudiness;
                        myWe18.iconId = iconId;
                        myWe18.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe19
                Connections {
                    target: weatherbridge
                    onSendWeatherData18: {
                        myWe19.maxTemp = maxTemp;
                        myWe19.minTemp = minTemp;
                        myWe19.windSpeed = windSpeed;
                        myWe19.rainLitre = rainLitre;
                        myWe19.snow = snow;
                        myWe19.humidity = humidity;
                        myWe19.pressure = pressure;
                        myWe19.cloudiness = cloudiness;
                        myWe19.iconId = iconId;
                        myWe19.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe20
                Connections {
                    target: weatherbridge
                    onSendWeatherData19: {
                        myWe20.maxTemp = maxTemp;
                        myWe20.minTemp = minTemp;
                        myWe20.windSpeed = windSpeed;
                        myWe20.rainLitre = rainLitre;
                        myWe20.snow = snow;
                        myWe20.humidity = humidity;
                        myWe20.pressure = pressure;
                        myWe20.cloudiness = cloudiness;
                        myWe20.iconId = iconId;
                        myWe20.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe21
                Connections {
                    target: weatherbridge
                    onSendWeatherData20: {
                        myWe21.maxTemp = maxTemp;
                        myWe21.minTemp = minTemp;
                        myWe21.windSpeed = windSpeed;
                        myWe21.rainLitre = rainLitre;
                        myWe21.snow = snow;
                        myWe21.humidity = humidity;
                        myWe21.pressure = pressure;
                        myWe21.cloudiness = cloudiness;
                        myWe21.iconId = iconId;
                        myWe21.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe22
                Connections {
                    target: weatherbridge
                    onSendWeatherData21: {
                        myWe22.maxTemp = maxTemp;
                        myWe22.minTemp = minTemp;
                        myWe22.windSpeed = windSpeed;
                        myWe22.rainLitre = rainLitre;
                        myWe22.snow = snow;
                        myWe22.humidity = humidity;
                        myWe22.pressure = pressure;
                        myWe22.cloudiness = cloudiness;
                        myWe22.iconId = iconId;
                        myWe22.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe23
                Connections {
                    target: weatherbridge
                    onSendWeatherData22: {
                        myWe23.maxTemp = maxTemp;
                        myWe23.minTemp = minTemp;
                        myWe23.windSpeed = windSpeed;
                        myWe23.rainLitre = rainLitre;
                        myWe23.snow = snow;
                        myWe23.humidity = humidity;
                        myWe23.pressure = pressure;
                        myWe23.cloudiness = cloudiness;
                        myWe23.iconId = iconId;
                        myWe23.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe24
                Connections {
                    target: weatherbridge
                    onSendWeatherData23: {
                        myWe24.maxTemp = maxTemp;
                        myWe24.minTemp = minTemp;
                        myWe24.windSpeed = windSpeed;
                        myWe24.rainLitre = rainLitre;
                        myWe24.snow = snow;
                        myWe24.humidity = humidity;
                        myWe24.pressure = pressure;
                        myWe24.cloudiness = cloudiness;
                        myWe24.iconId = iconId;
                        myWe24.infoHead = dateInfo;
                    }
                }
            }
            ChBeWeatherBox {
                id:myWe25
                Connections {
                    target: weatherbridge
                    onSendWeatherData24: {
                        myWe25.maxTemp = maxTemp;
                        myWe25.minTemp = minTemp;
                        myWe25.windSpeed = windSpeed;
                        myWe25.rainLitre = rainLitre;
                        myWe25.snow = snow;
                        myWe25.humidity = humidity;
                        myWe25.pressure = pressure;
                        myWe25.cloudiness = cloudiness;
                        myWe25.iconId = iconId;
                        myWe25.infoHead = dateInfo;
                    }
                }
            }



        }






    }







}







