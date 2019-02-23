import QtQuick 2.0

Item {
    id:root
    //ProgressBar Dimensions
    property int pbW: 160
    property int pbH: 20
    property int pbRad:2
    property int pbX: 0
    property int pbY: 0
    //ProgressBar ranges
    property real pbMin : -25
    property real pbMax : 50
    property real pbVal : 0
    //ProgressBar Coloring
    property string textColor : "white"
    property string pbText : "The-H-Graph"
    property real pbTextSize : 6.0
    property color gradColorOpen: "white"
    property color gradColorDone: "yellow"
    property color pbColorOpen: "gray"
    property color pbColorDone: "lime"
    property color borderColor: "black"

    property int borderWidth: 1

    Rectangle{
        id:rect
        width:root.pbW
        height:root.pbH
        color: "#00000000"
        x:root.pbX
        y:root.pbY
        border.color: "black"
        border.width: root.borderWidth

        Rectangle{
            id:done
            width:root.pbW *((root.pbVal - root.pbMin)/(root.pbMax-root.pbMin))  //  + root.borderWidth
            height:root.pbH
            radius:root.pbRad
            antialiasing:false
            x:0
            y:0
            gradient: Gradient {
                    GradientStop { position: 0.0; color: root.pbColorDone}
                    GradientStop { position: 1.0; color: root.gradColorDone }
            }
            border.color: root.borderColor
            border.width: root.borderWidth
        }

        Rectangle{
            id:open
            width:root.pbW - root.pbW *((root.pbVal - root.pbMin)/(root.pbMax-root.pbMin))  //  + root.borderWidth
            height:root.pbH
            radius:root.pbRad
            antialiasing:false
            x:0 + done.width
            y:0
            gradient: Gradient {
                    GradientStop { position: 0.0; color: root.pbColorOpen}
                    GradientStop { position: 1.0; color: root.gradColorOpen }
            }
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Text{
            id:text
            anchors.centerIn: parent
            color:root.textColor
            text:(root.pbVal).toFixed(2) + root.pbText
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  root.pbTextSize
        }
        Text {
            color:root.textColor
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.pointSize:  root.pbTextSize
            text:root.pbMin
            anchors.top: parent.bottom
            anchors.left: parent.left
        }
        Text {
            color:root.textColor
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.pointSize:  root.pbTextSize
            text:root.pbMax
            anchors.top: parent.bottom
            anchors.right: parent.right
        }






    }


}
