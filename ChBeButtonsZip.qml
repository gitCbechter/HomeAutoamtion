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
    property color boxHeadBackColor: "black"
    property color boxButtonBackColorStart: "white"
    property color boxButtonBackColorStop: "gray"
    property color boxHeadTextColor: "white"
    //InfoBox Contents
    property string boxHead : "TheText"
    //InfoBox TextSizes
    property real boxHeadSize : 12.0
    //Configs
    property int durationUp: 5000
    property int durationDwn: 5000

    //Signals to be fired
    signal clickedStop(int number);
    signal clickedUp(int number);
    signal clickedDwn(int number);
    signal timeOutUp(int number);
    signal timeOutDwn(int number);

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
            ChBeTimerButton{
                id:zipUp
                buttonW: 75
                buttonH: 40
                buttonRad:4
                buttonX: 10
                buttonY: 16
                buttonText : "Up"
                duration : root.durationUp
                onClicked : {
                    root.clickedUp(0)
                    zipDwn.rectState.color = zipDwn.statusInActiveColor
                    zipDwn.tim.stop()
                    zipDwn.statusButton = false
                }//ctrlbridge.zipButtonPrincess(1)
                onTimedout : root.timeOutUp(0)//ctrlbridge.zipButtonPrincess(-1)
            }
            ChBeButton{
                id:zipStop
                buttonW: 74
                buttonH: 40
                buttonRad:4
                buttonX: zipUp.buttonW + 20
                buttonY: 16
                buttonText : "Stop"
                //onClicked: ctrlbridge.zipButtonPrincess(0)
                onClicked: {
                    root.clickedStop(0);//dummy gets overwritten via qml data
                    zipDwn.rectState.color = zipDwn.statusInActiveColor
                    zipDwn.tim.stop()
                    zipDwn.statusButton = false
                    zipUp.rectState.color = zipDwn.statusInActiveColor
                    zipUp.tim.stop()
                    zipUp.statusButton = false
                }
            }
            ChBeTimerButton{
                id:zipDwn
                buttonW: 75
                buttonH: 40
                buttonRad:4
                buttonX: buttons.width - 10 - zipDwn.buttonW
                buttonY: 16
                buttonText : "Dwn"
                duration : root.durationDwn
                onClicked : {
                    root.clickedDwn(0)//ctrlbridge.zipButtonPrincess(2)
                    zipUp.rectState.color = zipUp.statusInActiveColor
                    zipUp.tim.stop()
                    zipUp.statusButton = false
                }
                onTimedout : root.timeOutDwn(0)//ctrlbridge.zipButtonPrincess(-2)
            }
        }

     }
}
