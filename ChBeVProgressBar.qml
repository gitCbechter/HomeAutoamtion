import QtQuick 2.0

Item {
    id:root
    //ProgressBar Dimensions
    property int bgW: 12
    property int bgH: 160
    property int bgRad:0
    property int bgX: 0
    property int bgY: 0
    //ProgressBar ranges
    property real bgMin : -25
    property real bgMax : 50
    property real bgVal : 0
    //ProgressBar Coloring
    property string textColor : "white"
    property string text : "The-V-Graph"
    property real textSize : 6.0
    property color gradColorOpen: "white"
    property color gradColorDone: "red"
    property color colorOpen: "gray"
    property color colorDone: "orange"
    property color borderColor: "black"

    property int borderWidth: 1

    Rectangle{
        id:rect
        width:root.bgW
        height:root.bgH
        color: "#00000000"
        x:root.bgX
        y:root.bgY
        border.color: "black"
        border.width: root.borderWidth

        Rectangle{
            id:open
            width:root.bgW
            height:root.bgH - root.bgH * ((root.bgVal - root.bgMin)/(root.bgMax-root.bgMin))  + root.borderWidth
            radius:root.bgRad
            antialiasing:false
            x:0
            y:0
            gradient: Gradient {
                    GradientStop { position: 0.0; color: root.colorOpen}
                    GradientStop { position: 1.0; color: root.gradColorOpen }
            }
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Rectangle{
            id:done
            width:root.bgW
            height:root.bgH  * ((root.bgVal-root.bgMin)/(root.bgMax-root.bgMin)) + root.borderWidth
            radius:root.bgRad
            antialiasing:false
            x:0
            y:open.height
            gradient: Gradient {
                    GradientStop { position: 0.0; color: root.colorDone}
                    GradientStop { position: 1.0; color: root.gradColorDone }
            }
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Text{
            id:text
            anchors.centerIn: parent
            color:root.textColor
            text:(root.bgVal).toFixed(2) + " " + root.text
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.pointSize:  root.textSize
            rotation: 90
        }
        Text {
            color:root.textColor
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.pointSize:  root.textSize
            text:root.bgMin
            anchors.bottom: parent.bottom
            anchors.left: parent.right
        }
        Text {
            color:root.textColor
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.pointSize:  root.textSize
            text:root.bgMax
            anchors.top: parent.top
            anchors.left: parent.right
        }

    }


}
