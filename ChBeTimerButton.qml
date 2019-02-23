import QtQuick 2.0

Item {
    id:root
    //Button Dimensions
    property int buttonW: 40
    property int buttonH: 20
    property int buttonRad:4
    property int buttonX: 0
    property int buttonY: 0
    //Button Appearance
    property string textColorInActive : "white"
    property string textColorActive : "#C0C0C0"
    property string buttonText : "ChBeButton"
    property real buttonTextSize : 12.0
    //Button Coloring
    property color gradColorInActive: "black"
    property color gradColorActive: "white"
    property color buttonColorInActive: "white"
    property color buttonColorActive: "black"
    property color borderColor: "black"
    property int borderWidth: 2
    property color statusActiveColor: "lime"
    property color statusInActiveColor: "gray"
    property Rectangle rectState:statusRect
    property Timer tim:timer
    //Button Actions
    property bool statusButton:false
    property int duration : 0
    signal clicked(int number);
    signal timedout(int number);


    Timer{
        id:timer
        interval: root.duration
        repeat: false
        running: false

        onTriggered:{
            stop();
            statusRect.color = root.statusInActiveColor;
            root.statusButton = false;
            root.timedout(0);
        }
    }

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
                id:btntext
                anchors.centerIn: parent
                color:root.textColorInActive
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
                    statusRect.color = root.statusActiveColor;
                }
                else{
                    statusRect.color = root.statusInActiveColor;
                }
            }
            radius:2.0
            antialiasing:false
        }

        MouseArea{
            id:ma
            preventStealing: true
            anchors.fill: parent
            onEntered: {
                btntext.color = root.textColorActive
                statusRect.color = root.statusActiveColor
                rect.gradColor = root.gradColorActive;
                rect.mainColor = root.buttonColorActive;
            }
            onReleased: {
                btntext.color = root.textColorInActive
                statusRect.color = root.statusInActiveColor
                rect.gradColor = root.gradColorInActive;
                rect.mainColor = root.buttonColorInActive;
            }
            onClicked: {
                statusRect.color = root.statusActiveColor;
                root.clicked(0);//is dummy gets overwritten via qml data
                if(root.statusButton==false){
                    statusRect.color = root.statusActiveColor;
                    root.statusButton = true;
                    timer.start();
                }
                else{
                    statusRect.color = root.statusInActiveColor;
                    root.statusButton = false;
                    timer.stop();
                }
            }
        }


    }







}

