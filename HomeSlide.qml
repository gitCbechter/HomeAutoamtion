import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0


Item {
    id:root
    property int hpW: 0
    property int hpH: 0
    property int hpX: 0
    property int hpY: 0
    ChBeBackground{
        id:backgrCtrl
        bagrW: root.hpW
        bagrH: root.hpH
        bagrX: root.hpX
        bagrY: root.hpY
        gradColorStart: "gray"
        gradColorStop: "#404040"
    }

    ChBeInfoBox{
        id:timeBox
        infoH: 138
        infoW: 800
        infoX: 0
        infoY: 0
        infoHeadBackColor: "black"
        infoValBackColor: "gray"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 32
        infoValSize : 72

        infoHead : "---"
        infoVal : "00:00"

        Connections {
            target: homebridge
            onSendTimeInfo: {
                timeBox.infoVal = timeString;
                timeBox.infoHead = dateString;
            }
        }

    }

    Rectangle{
        id:infoSwiping
        width: 280
        height: 100
        x: 260
        y: 340
        color:"transparent"

        SwipeView {
            id: swipeView
            anchors.fill: parent
            Page {
                ChBeInfoBox{
                    id:outTempBoxSwiping
                    infoH: 100
                    infoW: 280
                    infoX: 0
                    infoY: 0
                    infoHeadBackColor: "black"
                    infoValBackColor: "#606060"
                    infoHeadTextColor: "white"
                    infoValTextColor: "white"

                    infoHeadSize : 12
                    infoValSize : 48

                    infoHead : "Outdoor Temp °C"
                    infoVal : "X.X°C"
                    Connections {
                        target: homebridge
                        onSendOutTempInfo: {
                            outTempBoxSwiping.infoVal = temperatureString;
                        }
                    }
                }
            }
            Page{
                ChBeInfoBox{
                    id:inTempBoxSwiping
                    infoH: 100
                    infoW: 280
                    infoX: 0
                    infoY: 0
                    infoHeadBackColor: "black"
                    infoValBackColor: "#606060"
                    infoHeadTextColor: "white"
                    infoValTextColor: "white"

                    infoHeadSize : 12
                    infoValSize : 48

                    infoHead : "Indoor Temp °C"
                    infoVal : "0.0°C"
                    Connections {
                        target: homebridge
                        onSendInTempInfo: {
                            inTempBoxSwiping.infoVal = temperatureString;
                        }
                    }
                }
            }
            Page{
                ChBeInfoBox{
                    id:windBoxSwiping
                    infoH: 100
                    infoW: 280
                    infoX: 0
                    infoY: 0
                    infoHeadBackColor: "black"
                    infoValBackColor: "#808080"
                    infoHeadTextColor: "white"
                    infoValTextColor: "white"
                    infoHeadSize : 12
                    infoValSize : 48
                    infoHead : "Wind Speed m/s"
                    infoVal : "0"
                    Connections {
                        target: homebridge
                        onSendWindSpeedInfo: {
                            windBoxSwiping.infoVal = windSpeedString;

                            if(parseFloat(windBoxSwiping.infoVal) > 2.0){
                                windBoxSwiping.infoValTextColor = "red"
                            }
                            else{
                                windBoxSwiping.infoValTextColor = "white"
                            }
                        }
                    }
                }
            }
            Page{
                ChBeInfoBox{
                    id:inHumiBoxSwiping
                    infoH: 100
                    infoW: 280
                    infoX: 0
                    infoY: 0
                    infoHeadBackColor: "black"
                    infoValBackColor: "#808080"
                    infoHeadTextColor: "white"
                    infoValTextColor: "white"

                    infoHeadSize : 12
                    infoValSize : 48

                    infoHead : "Indoor Humidity %rel"
                    infoVal : "0"
                    Connections {
                        target: homebridge
                        onSendInHumiInfo: {
                            inHumiBoxSwiping.infoVal = humiString;
                        }
                    }
                }
            }
            Page{
                ChBeInfoBox{
                    id:outHumiBoxSwiping
                    infoH: 100
                    infoW: 280
                    infoX: 0
                    infoY: 0
                    infoHeadBackColor: "black"
                    infoValBackColor: "#808080"
                    infoHeadTextColor: "white"
                    infoValTextColor: "white"

                    infoHeadSize : 12
                    infoValSize : 48

                    infoHead : "Outdoor Humidity %rel"
                    infoVal : "0"
                    Connections {
                        target: homebridge
                        onSendOutHumiInfo: {
                            outHumiBoxSwiping.infoVal = humiString;
                        }
                    }
                }
            }
            Page{
                ChBeInfoBox{
                    id:pressBoxSwiping
                    infoH: 100
                    infoW: 280
                    infoX: 0
                    infoY: 0
                    infoHeadBackColor: "black"
                    infoValBackColor: "#808080"
                    infoHeadTextColor: "white"
                    infoValTextColor: "white"

                    infoHeadSize : 12
                    infoValSize : 48

                    infoHead : "Pressure hPa"
                    infoVal : "0"
                    Connections {
                        target: homebridge
                        onSendPressInfo: {
                            pressBoxSwiping.infoVal = pressString;
                        }
                    }

                }
            }
        }
    }
    Rectangle{
        id:markerSwiping
        width: 280
        height: 100
        x: 260
        y: 340
        border.color: "white"
        border.width: 4
        color:"transparent"

    }
    Rectangle{
        width: 800
        height: 200
        x:0
        y:138
        border.color: "black"
        border.width: 2
        radius: 4
        antialiasing: false
        color: "Transparent"
        ChBeWeatherTableau{

        }
    }





}
