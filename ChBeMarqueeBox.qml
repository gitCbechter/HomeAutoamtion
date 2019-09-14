import QtQuick 2.0

Item {
    id:root
    //InfoBox Dimensions
    property int infoH: 60
    property int infoW: 120
    property int infoX: 0
    property int infoY: 0
    //InfoBox Coloring
    property color infoBackColor: "gray"
    property color infoTextColor: "white"
    //InfoBox Contents
    property string theText : "TheText"
    //InfoBox TextSize
    property real infoTextSize : 8.0

    Rectangle{
        id:frame
        width: root.infoW
        height: root.infoH
        x: root.infoX
        y: root.infoY
        border.color: "black"
        border.width: 1
        radius: 4
        color: "gray"
        antialiasing:false

        Rectangle{
            id:val
            width: root.infoW
            height:root.infoH
            x: 0
            y: 0
            color: root.infoBackColor

            border.width: 1
            radius: 4
            antialiasing:false
            Text {
                id: valtext
                anchors.centerIn: parent
                text: root.theText
                color:root.infoTextColor
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  root.infoTextSize
            }
        }

     }
}
