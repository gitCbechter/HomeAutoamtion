import QtQuick 2.0

Item {
    id:root
    //Box Dimensions
    property int infoH: 200
    property int infoW: 100
    property int infoX: 0
    property int infoY: 0
    //Box Coloring
    property color infoHeadBackColor: "black"
    property color infoValBackColor: "gray"
    property color infoHeadTextColor: "white"
    property color infoValTextColor: "white"


    property string infoHead : "31.12. 03:00"
    property string iconId : "13d"
    property double maxTemp : 0
    property double minTemp : 0
    property double windSpeed : 0
    property double rainLitre : 0
    property double snow: 0
    property double humidity : 0
    property double pressure: 0
    property int cloudiness: 0


    property real infoHeadSize : 8.0



    Rectangle{
        id:frame
        width: root.infoW
        height: root.infoH
        x: root.infoX
        y: root.infoY
        border.color: "black"
        border.width: 1
        radius: 4
        gradient: Gradient {
                GradientStop { position: 0.0; color: root.infoValBackColor}
                GradientStop { position: 1.0; color: "#404040" }
        }
        antialiasing:false
        Rectangle{
            id:info
            width: root.infoW
            height:root.infoH/8 + border.width
            x: 0
            y: 0
            color: root.infoHeadBackColor




            border.color: "black"
            border.width: 1
            radius: 4
            antialiasing:false
            Text {
                id: infotext
                anchors.centerIn: parent
                text: root.infoHead
                color:root.infoHeadTextColor
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  6
            }
        }

        Rectangle{
            id:tempWF
            width: root.infoW
            height:48
            x: 0
            y: info.height
            color: "white"
            border.color: "black"
            border.width: 1
            radius: 2
            antialiasing:false
            Text {
                id: tempWFtext
                anchors.centerIn: parent
                text: maxTemp.toFixed(1) + "° \n" + minTemp.toFixed(1) + "° "
                color:"black"                
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  16.0
            }
        }
        Rectangle{
            id:sunWF
            width: root.infoW
            height: 42
            x: 0
            y: tempWF.y + tempWF.height
            color: "white"
            border.color: "black"
            border.width: 1
            radius: 2
            antialiasing:false
            Rectangle{
                id:picSunWf
                width: 55
                height:sunWF.height
                x: -8
                y: 0
                color:"transparent"
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "https://openweathermap.org/img/w/" + iconId + ".png"
                }
            }


            Text {
                id: sunWFtext
                x: 36
                anchors.verticalCenter: parent.verticalCenter
                text: cloudiness + "%"
                color:"black"                
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  10.0
            }

        }
        Rectangle{
            id:windWF
            width: root.infoW
            height: 42
            x: 0
            y: sunWF.y + sunWF.height
            color: "white"
            border.color: "black"
            border.width: 1
            radius: 2
            antialiasing:false
            Rectangle{
                id:picWindWf
                width: 24
                height:windWF.height
                x: 2
                y: 0
                color:"transparent"
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "windy.png"
                }
            }
            Text {
                id: windWFtext
                anchors.left: picWindWf.right
                anchors.verticalCenter: parent.verticalCenter
                text: windSpeed.toFixed(1) + "m/s "
                color:"black"
                //style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  10.0
            }

        }
        Rectangle{
            id:rainWF
            width: root.infoW
            height: 42
            x: 0
            y: windWF.y + windWF.height
            color: "white"
            border.color: "black"
            border.width: 1
            radius: 2
            antialiasing:false
            Rectangle{
                id:picRainWf
                width: 24
                height:rainWF.height
                x: 2
                y: 0
                color:"transparent"
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "rain.png"
                }
            }
            Text {
                id: rainWFtext
                anchors.left: picRainWf.right
                anchors.verticalCenter: parent.verticalCenter
                text: "  " + rainLitre.toFixed(2) + "l "
                color:"black"
                //style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  10.0
            }

        }
    }

}


