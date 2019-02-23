import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0


Item {
    id:root
    property int hpW: 0
    property int hpH: 0
    property int hpX: 0
    property int hpY: 0
    ChBeBackground{
        id:backgrCtrl
        bagrW: root.hpW
        bagrH: root.hpH
        bagrX: root.hpX
        bagrY: root.hpY
        gradColorStart: "white"
        gradColorStop: "black"//"#000000"
    }
    Rectangle{
        id:headlineI
        width: 800
        height: 48
        x: 0
        y: 0
        color: "black"

        border.color: "black"
        border.width: 1
        radius: 4
        antialiasing:false
        Text {
            id: infotextI
            anchors.centerIn: parent
            text: "Switch Devices"
            color:"white"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  24
        }
        Rectangle{
            id:hutStuff
            width: 250
            height:hutBox.boxTextH + hutBox.boxButtonsH
            x: 0
            y: headlineI.height
            color: "Transparent"
            ChBeButtonBox{
                id:hutBox
                boxTextH: 30
                boxButtonsH: hut.buttonH+32
                boxW: hutStuff.width
                boxX: 0
                boxY: 0
                boxHead : "Hut Switches"
            }
            ChBeToggleButton{
                id: hut
                buttonW: hutStuff.width - 32
                buttonH: 48
                buttonRad:4
                buttonX: 16
                buttonY: 16+hutBox.boxTextH
                statusActiveColor: "lime"
                textColor : "white"
                buttonText : "Hut Light"
                buttonTextSize : 12.0
                onActivated: ctrlbridge.hutLightSwitched(1)
                onDeactivated: ctrlbridge.hutLightSwitched(-1)
            }
        }
    }
    Rectangle{
        id:outdoorStuff
        width: 250
        height:outdoorBox.boxTextH + outdoorBox.boxButtonsH
        x: hutStuff.width + 24
        y: headlineI.height
        color: "Transparent"
        ChBeButtonBox{
            id:outdoorBox
            boxTextH: 30
            boxButtonsH: pump.buttonH+32
            boxW: outdoorStuff.width
            boxX: 0
            boxY: 0
            boxHead : "Outdoor Switches"
        }
        ChBeToggleButton{
            id: pump
            buttonW: outdoorStuff.width - 32
            buttonH: 48
            buttonRad:4
            buttonX: 16
            buttonY: 16+outdoorBox.boxTextH
            statusActiveColor: "lime"
            textColor : "white"
            buttonText : "Power Pump"
            buttonTextSize : 12.0
            onActivated: ctrlbridge.outPumpSwitched(1)
            onDeactivated: ctrlbridge.outPumpSwitched(-1)
        }
    }
    Rectangle{
        id:indoorStuf
        width: 250
        height:indoorBox.boxTextH + indoorBox.boxButtonsH
        x: hutStuff.width+outdoorStuff.width + 48
        y: headlineI.height
        color: "Transparent"
        ChBeButtonBox{
            id:indoorBox
            boxTextH: 30
            boxButtonsH: 16 + winOpen.buttonH + 8 + winClose.buttonH + 16
            boxW: indoorStuf.width
            boxX: 0
            boxY: 0
            boxHead : "Indoor Switches"
        }
        ChBeToggleButton{
            id: winOpen
            buttonW: indoorStuf.width - 32
            buttonH: 48
            buttonRad:4
            buttonX: 16
            buttonY: 16+indoorBox.boxTextH
            statusActiveColor: "lime"
            textColor : "white"
            buttonText : "Window Open"
            buttonTextSize : 12.0
            onActivated: {
                winClose.statusButton = false
                winClose.rectState.color = winClose.statusInActiveColor
                ctrlbridge.indoorWindow(1)
            }
            onDeactivated: ctrlbridge.indoorWindow(0)
        }
        ChBeToggleButton{
            id: winClose
            buttonW: indoorStuf.width - 32
            buttonH: 48
            buttonRad:4
            buttonX: 16
            buttonY: 16 + indoorBox.boxTextH + 8 + winOpen.buttonH
            statusActiveColor: "lime"
            textColor : "white"
            buttonText : "Window Close"
            buttonTextSize : 12.0
            onActivated: {
                winOpen.statusButton = false
                winOpen.rectState.color = winOpen.statusInActiveColor
                ctrlbridge.indoorWindow(-1)
            }
            onDeactivated: ctrlbridge.indoorWindow(0)
        }
    }
}









