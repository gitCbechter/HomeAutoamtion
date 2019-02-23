import QtQuick 2.0

Item {
    id:root
    //InfoBox Dimensions
    property int infoH: 60
    property int infoW: 120
    property int infoX: 0
    property int infoY: 0
    //InfoBox Coloring
    property color infoHeadBackColor: "black"
    property color infoValBackColor: "gray"
    property color infoHeadTextColor: "white"
    property color infoValTextColor: "white"
    //InfoBox Contents
    property string infoHead : "TheText"
    property string infoVal : "TheVal"
    //InfoBox TextSizes
    property real infoHeadSize : 8.0
    property real infoValSize : 8.0

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
            id:info
            width: root.infoW
            height:root.infoH/3 + border.width
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
                font.pointSize:  root.infoHeadSize
            }
        }
        Rectangle{
            id:val
            width: root.infoW
            height:root.infoH - root.infoH/3
            x: 0
            y: root.infoH/3
            color: root.infoValBackColor

            border.width: 1
            radius: 4
            antialiasing:false
            Text {
                id: valtext
                anchors.centerIn: parent
                text: root.infoVal
                color:root.infoValTextColor
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  root.infoValSize
            }
        }

     }
}
