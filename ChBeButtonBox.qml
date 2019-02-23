import QtQuick 2.0

Item {
    id:root
    //InfoBox Dimensions
    property int boxTextH: 30
    property int boxButtonsH: 260
    property int boxW: 260
    property int boxX: 0
    property int boxY: 0
    //InfoBox Coloring
    property color boxHeadBackColor: "gray"
    property color boxButtonBackColorStart: "white"
    property color boxButtonBackColorStop: "gray"
    property color boxHeadTextColor: "white"
    //InfoBox Contents
    property string boxHead : "TheText"
    //InfoBox TextSizes
    property real boxHeadSize : 12.0

    Rectangle{
        id:frame
        width: root.boxW
        height: root.boxTextH + boxButtonsH
        x: root.boxX
        y: root.boxY
        color:"transparent"
        Rectangle{
            id:info
            width: root.boxW
            height:root.boxTextH
            x: 0
            y: 0
            color: root.boxHeadBackColor

            border.color: "black"
            border.width: 1
            radius: 4
            antialiasing:false
            Text {
                id: boxtext
                anchors.centerIn: parent
                text: root.boxHead
                color:root.boxHeadTextColor
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  root.boxHeadSize
            }
        }
        Rectangle{
            id:buttons
            width: root.boxW
            height:root.boxButtonsH
            x: 0
            y: root.boxTextH
            gradient: Gradient {
                    GradientStop { position: 0.0; color: root.boxButtonBackColorStart}
                    GradientStop { position: 1.0; color: root.boxButtonBackColorStop }
            }
            border.width: 1
            radius: 4
            antialiasing:false
        }
     }
}
