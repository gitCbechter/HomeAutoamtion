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
        gradColorStart: "white"
        gradColorStop: "black"
    }

    ChBeInfoBox{
        id:timeBox
        infoH: 168
        infoW: 800
        infoX: 0
        infoY: 0
        infoHeadBackColor: "black"
        infoValBackColor: "gray"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 40
        infoValSize : 88

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
    /*
    ChBeMarqueeBox{
        id:marquee
        infoH: 30
        infoW: 800
        infoX: 0
        infoY: 170
        infoBackColor: "gray"
        infoTextColor: "white"
        theText : "Moskau: Russisches Flugzeug fängt Feuer – Tote und Verletzte - t-online.de"
        infoTextSize : 10.0
        NumberAnimation {
                    target: marquee.theText;
                    property: 'x';
                    loops: Animation.Infinite;
                    duration: marquee.infoW * 10;
                    from: marquee.infoW;
                    to: -marquee.infoW;
                    running: true;
        }
    }
*/

    Text {
        id: marqueeTextLine1;
        width: 800
        x: 0
        y: 170
        height: 20;
        font.family: 'Verdana';
        font.pointSize: 14.0;
        color: "white";
        text: "XXX";
        Connections {
            target: homebridge
            onSendLine1: {
                marqueeTextLine1.text = txt;
            }
        }
        NumberAnimation {
            target: marqueeTextLine1;
            property: 'x';
            loops: Animation.Infinite;
            duration: 1200 * 10;
            from: 800;
            to: -1200;
            running: true;
        }
    }

    Text {
        id: marqueeTextLine2;
        width: 800
        x: 0
        y: 200
        height: 40;
        font.family: 'Verdana';
        font.pointSize: 16.0;
        color: "white";
        text: "XXX";
        Connections {
            target: homebridge
            onSendLine2: {
                marqueeTextLine2.text = txt;
            }
        }
        NumberAnimation {
            target: marqueeTextLine2;
            property: 'x';
            loops: Animation.Infinite;
            duration: 1500 * 10;
            from: 800;
            to: -2400;
            running: true;
        }
    }


    Text {
        id: marqueeTextLine3;
        width: 800
        x: 0
        y: 240
        height: 20;
        font.family: 'Verdana';
        font.pointSize: 12.0;
        color: "white";
        text: "XXX";
        Connections {
            target: homebridge
            onSendLine3: {
                marqueeTextLine3.text = txt;
            }
        }
        NumberAnimation {
            target: marqueeTextLine3;
            property: 'x';
            loops: Animation.Infinite;
            duration: 600 * 10;
            from: 800;
            to: -400;
            running: true;
        }
    }



    ChBeInfoBox{
        id:outTempBox
        infoH: 100
        infoW: 266
        infoX: 0
        infoY: 264
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
                outTempBox.infoVal = temperatureString;
            }
        }
    }
    ChBeInfoBox{
        id:inTempBox
        infoH: 100
        infoW: 266
        infoX: 267
        infoY: 264
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
                inTempBox.infoVal = temperatureString;
            }
        }
    }
    ChBeInfoBox{
        id:windBox
        infoH: 100
        infoW: 266
        infoX: 534
        infoY: 264
        infoHeadBackColor: "black"
        infoValBackColor: "#606060"
        infoHeadTextColor: "white"
        infoValTextColor: "white"
        infoHeadSize : 12
        infoValSize : 48
        infoHead : "Wind Speed m/s"
        infoVal : "0"
        Connections {
            target: homebridge
            onSendWindSpeedInfo: {
                windBox.infoVal = windSpeedString;

                if(parseFloat(windBox.infoVal) > 5.0){
                    windBox.infoValTextColor = "red"
                }
                else{
                    windBox.infoValTextColor = "white"
                }
            }
        }
    }
    ChBeInfoBox{
        id:outHumiBox
        infoH: 100
        infoW: 266
        infoX: 0
        infoY: 364
        infoHeadBackColor: "black"
        infoValBackColor: "#606060"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 12
        infoValSize : 48

        infoHead : "Outdoor Humidity %rel"
        infoVal : "0"
        Connections {
            target: homebridge
            onSendOutHumiInfo: {
                outHumiBox.infoVal = humiString;
            }
        }
    }
    ChBeInfoBox{
        id:inHumiBox
        infoH: 100
        infoW: 266
        infoX: 267
        infoY: 364
        infoHeadBackColor: "black"
        infoValBackColor: "#606060"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 12
        infoValSize : 48

        infoHead : "Indoor Humidity %rel"
        infoVal : "0"
        Connections {
            target: homebridge
            onSendInHumiInfo: {
                inHumiBox.infoVal = humiString;
            }
        }
    }
    ChBeInfoBox{
        id:pressBox
        infoH: 100
        infoW: 266
        infoX: 534
        infoY: 364
        infoHeadBackColor: "black"
        infoValBackColor: "#606060"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 12
        infoValSize : 48

        infoHead : "Pressure hPa"
        infoVal : "0"
        Connections {
            target: homebridge
            onSendPressInfo: {
                pressBox.infoVal = pressString;
            }
        }

    }





    /*
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
    */
    /*
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
*/




}
