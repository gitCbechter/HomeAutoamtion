import QtQuick 2.0

Item {
    id:root
    property int buttonW: 160
    property int buttonH: 48
    property int buttonRad:2
    property int buttonX: 0
    property int buttonY: 0

    property string textColor : "white"
    property string buttonText : "ExpBtn"
    property real buttonTextSize : 12.0

    property color gradColorInActive: "black"
    property color gradColorActive: "white"
    property color buttonColorInActive: "white"
    property color buttonColorActive: "black"
    property color borderColor: "black"
    property int borderWidth: 2
    property color statusActiveColor: "lime"
    property color statusInActiveColor: "gray"

    property bool statusButton:false

    property Rectangle r1:statusRect

    signal activated(int number);
    signal deactivated(int number);

    Rectangle{
        id:rect
        width:root.buttonW
        height:root.buttonH
        radius:root.buttonRad
        antialiasing:false
        x:root.buttonX
        y:root.buttonY
        property color gradColor : root.gradColorInActive
        property color mainColor : root.buttonColorInActive
        gradient: Gradient {
                GradientStop { position: 0.0; color: rect.mainColor}
                GradientStop { position: 1.0; color: rect.gradColor }
        }

        border.color: root.borderColor
        border.width: root.borderWidth

        Rectangle{
            id:rectText
            width:root.buttonW - statusRect.width - statusRect.x
            height:root.buttonH
            x:statusRect.width + statusRect.x
            y:0
            color:"transparent"

            Text{
                id:text
                anchors.centerIn: parent
                color:root.textColor
                text:root.buttonText
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  root.buttonTextSize
            }
        }
        Rectangle{
            id:statusRect
            width:16
            height:8
            x:4
            y:rect.height/2 - height/2
            border.color: "black"
            border.width: 1
            color : {
                if(root.statusButton==true){
                    statusRect.color = root.statusActiveColor
                }
                else{
                    statusRect.color = root.statusInActiveColor
                }
            }
            radius:2.0
            antialiasing:false
        }


        MouseArea{
            id:ma
            anchors.fill: parent
            preventStealing: true
            onEntered: {
                text.font.pointSize = root.buttonTextSize //- 1
                rect.gradColor = root.gradColorActive
                rect.mainColor = root.buttonColorActive
            }
            onReleased: {
                text.font.pointSize = root.buttonTextSize
                rect.gradColor = root.gradColorInActive
                rect.mainColor = root.buttonColorInActive
            }
            onClicked: {
                if(root.statusButton==false){
                    statusRect.color = root.statusActiveColor
                    root.statusButton = true
                    root.activated(0);//is dummy gets overwritten via main.qml data
                }
                else{
                    statusRect.color = root.statusInActiveColor
                    root.statusButton = false
                    root.deactivated(0);//is dummy gets overwritten via main.qml data
                }
            }
        }
        /*
        Connections{
            target:ctrlbridge
            onExpBtnChanged: {
                console.log("Got the Emitted Signal in the heart...")
                console.log(index)
                if(index<0){
                    statusRect.color = root.statusInActiveColor
                    root.statusButton = false
                }
            }

        }
        */


    }



}

