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
    property int durationLam: 0

    property bool isChecked: false

    //Signals to be fired
    signal clickedStop(int number);
    signal clickedUp(int number);
    signal clickedDwn(int number);
    signal timeOutUp(int number);
    signal timeOutDwn(int number);
    signal lamUp(int number);
    signal lamDwn(int number);    
    signal lamUpOut(int val);
    signal lamDwnOut(int val);


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
                buttonH: 48
                buttonRad:4
                buttonX: 10
                buttonY: 10
                buttonText : "Up"
                duration : root.durationUp
                onClicked : {
                    root.clickedUp(0)//ctrlbridge.zipButtonPrincess(1)
                    zipDwn.rectState.color = zipDwn.statusInActiveColor
                    zipDwn.tim.stop()
                    zipDwn.statusButton = false
                }
                onTimedout : root.timeOutUp(0)//ctrlbridge.zipButtonPrincess(-1)
            }
            ChBeButton{
                id:zipStop
                buttonW: 74
                buttonH: 48
                buttonRad:4
                buttonX: zipUp.buttonW + 20
                buttonY: 10
                buttonText : "Stop"
                //onClickectrlbridge.jalLamTimeAll(btnJalII.durationLam)d: ctrlbridge.zipButtonPrincess(0)
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
                buttonH: 48
                buttonRad:4
                buttonX: buttons.width - 10 - zipDwn.buttonW
                buttonY: 10
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
            ChBeTimerButton{
                id:angleUp
                buttonW: 118
                buttonH: 32
                buttonRad:4
                buttonX: 10
                buttonY: 16+zipDwn.height+32 + root.boxTextH //slide.slideY + slide.height + root.boxTextH +22
                buttonText : "LamUp"
                duration: durationLam
                onClicked : {
                    angleDwn.rectState.color = angleDwn.statusInActiveColor
                    angleDwn.tim.stop()
                    angleDwn.statusButton = false
                    root.lamUp(0)
                }
                onTimedout : root.lamUpOut(0)
            }
            ChBeTimerButton{
                id:angleDwn
                buttonW: 118
                buttonH: 32
                buttonRad:4
                buttonX: 10 + 8 + angleUp.buttonW
                buttonY: 16+zipDwn.height+32 + root.boxTextH //slide.slideY + slide.height + root.boxTextH +22
                buttonText : "LamDwn"
                duration: durationLam
                onTimedout : root.lamDwnOut(0)
                onClicked : {
                    angleUp.rectState.color = angleUp.statusInActiveColor
                    angleUp.tim.stop()
                    angleUp.statusButton = false
                    root.lamDwn(0)
                }
            }

            /*
            ChBeHSlider{
                id:slide
                slideH: 32
                slideW: root.boxW - 20-32
                slideX: 10
                slideY: 16+zipDwn.height+32 + root.boxTextH
                //onValSliderChanged :root.timeLam(slide.val)
                onValSliderChanged: {
                    root.timeLam(slide.val);
                    durationLam = slide.val*2;
                }





            }

            ChBeCheckBox{
                id:checker
                cbText : "Automatic"
                cbX: 10
                cbY: 16+angleDwn.buttonH+angleDwn.buttonY
                onClicked: {                    
                    root.isChecked = checker.checked                                       
                    root.auto(checker.checked)                    
                }
            }
            */

        }

     }
}
