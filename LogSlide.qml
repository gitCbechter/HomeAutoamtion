import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtCharts 2.1
import QtQuick.Window 2.2

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
    Rectangle{
        id:headlineI
        width: 800
        height: 48
        x: 0
        y: 0
        color: "black"

        border.color: "black"
        border.width: 1
        radius: 4
        antialiasing:false
        Text {
            id: infotextI
            anchors.centerIn: parent
            text: "Weather Data Logging"
            color:"white"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  24
        }
    }
    Rectangle{
        id:chkBoxes
        width: 800
        height: 64
        x: 0
        y: 48
        color:"gray"
        border.color: "black"
        border.width: 1
        radius: 4
        antialiasing:false


        ChBeCheckBox{
            id:checkerTempOut
            cbText : "Outdoor Temp"
            textColor : "black"
            cbX: 5
            cbY: 10

        }
        ChBeCheckBox{
            id:checkerTempIn
            textColor : "gray"
            cbText : "Indoor Temp"
            cbX: 5
            cbY: 36

        }
        ChBeCheckBox{
            id:checkerWindSpeed
            textColor : "skyblue"
            cbText : "Wind Speed"
            cbX: 200
            cbY: 10

        }

        ChBeCheckBox{
            id:checkerHumidity
            textColor : "springgreen"
            cbText : "Humidity"
            cbX: 200
            cbY: 36

        }



        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " < "
            buttonX:480
            buttonY: 2
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.minXborders(0);
            }
        }
        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " << "
            buttonX:480
            buttonY: 33
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.minXborders(1);
            }
        }
        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " > "
            buttonX:530
            buttonY: 2
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.minXborders(2);
            }
        }
        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " >> "
            buttonX:530
            buttonY: 33
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.minXborders(3);
            }
        }
        ChBeButton{
            borderWidth:1
            buttonTextSize : 12.0
            buttonText: "Full"
            buttonX:580
            buttonY: 2
            buttonW: 58
            buttonH: 29
            onClicked: {
                datamonitorlog.viewFull(0);
            }
        }
        ChBeButton{
            borderWidth:1
            buttonTextSize : 12.0
            buttonText: "Day"
            buttonX:580
            buttonY: 33
            buttonW: 58
            buttonH: 29
            onClicked: {
                datamonitorlog.viewFull(1);
            }
        }
        ChBeButton{
            borderWidth:1
            buttonTextSize : 12.0
            buttonText: "Mon"
            buttonX:640
            buttonY: 2
            buttonW: 58
            buttonH: 29
            onClicked: {
                datamonitorlog.viewFull(3);
            }
        }
        ChBeButton{
            borderWidth:1
            buttonTextSize : 12.0
            buttonText: "Week"
            buttonX:640
            buttonY: 33
            buttonW: 58
            buttonH: 29
            onClicked: {
                datamonitorlog.viewFull(2);
            }
        }

        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " < "
            buttonX:700
            buttonY: 2
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.maxXborders(0);
            }
        }
        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " << "
            buttonX:700
            buttonY: 33
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.maxXborders(1);
            }
        }
        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " > "
            buttonX:750
            buttonY: 2
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.maxXborders(2);
            }
        }
        ChBeAutoRepeatButton{
            borderWidth:1
            buttonText: " >> "
            buttonX:750
            buttonY: 33
            buttonW: 48
            buttonH: 29
            onClicked: {
                datamonitorlog.maxXborders(3);
            }
        }
        ChBeButton{
            buttonText: "up*"
            buttonX:350
            buttonY: 0
            buttonW: 50
            buttonH: 32
            onClicked: datamonitorlog.update(1024)
        }
        ChBeButton{
            buttonText: "up"
            buttonX:350
            buttonY: 32
            buttonW: 50
            buttonH: 32
            onClicked: datamonitorlog.update(1)
        }
    }
    Rectangle{
        id:dataView
        width: 800
        height: 355
        x: 0
        y: 112
        color: "white"

        border.color: "black"
        border.width: 1
        radius: 4
        antialiasing:false

        Connections{
            target:datamonitorlog
            onWValueChanged: {
                tempOut.append(datamonitorlog.pTempOutValue.x, datamonitorlog.pTempOutValue.y);
                tempIn.append(datamonitorlog.pTempInValue.x, datamonitorlog.pTempInValue.y);
                windSpeed.append(datamonitorlog.pWindOutValue.x, datamonitorlog.pWindOutValue.y);
                humi.append(datamonitorlog.pHumiInValue.x, datamonitorlog.pHumiInValue.y);
                if(tempIn.count>7200){
                    //datamonitorlog.pMeasIndex = 0

                }
            }
            onWScaleChanged: {
                axisX.max = datamonitorlog.pMaxX;
                axisX.min = datamonitorlog.pMinX;
            }
        }
        ChartView {
            id: chartView
            anchors.fill: parent
            antialiasing: true
            legend{
                visible: false
            }
            ValueAxis {
                id: axisX
                min: 0
                max: 16
                tickCount: 5
            }
            ValueAxis {
                id: axisYtemp
                min: -30
                max: 50
                tickCount: 9
                minorTickCount: 1
            }
            ValueAxis {
                id: axisYwind
                min: 0
                max: 20
                color: "skyblue"

            }
            ValueAxis {
                id: axisYhumi
                min: 0
                max: 100
            }
            LineSeries {
                id:tempOut
                color: "black"
                axisX: axisX
                axisY: axisYtemp
                visible: checkerTempOut.checked
                width: 2
            }
            LineSeries {
                id:tempIn
                color: "gray"
                axisX: axisX
                axisY: axisYtemp
                visible: checkerTempIn.checked
                width: 2
            }
            LineSeries {
                id:windSpeed
                color: "skyblue"
                axisX: axisX
                axisYRight: axisYwind
                visible: checkerWindSpeed.checked
                width: 2
            }
            LineSeries {
                id:humi
                color: "springgreen"
                axisX: axisX
                axisYRight: axisYhumi
                visible: checkerHumidity.checked
                width: 2

            }
        }
    }
}
