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
    //Button Signal Emitted
    signal clicked(int number);

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
        MouseArea{
            id:ma
            preventStealing: true
            anchors.fill: parent
            onEntered: {
                btntext.color = root.textColorActive
                rect.gradColor = root.gradColorActive
                rect.mainColor = root.buttonColorActive
            }
            onReleased: {
                btntext.color = root.textColorInActive
                rect.gradColor = root.gradColorInActive
                rect.mainColor = root.buttonColorInActive
            }
            onClicked: root.clicked(0);//dummy gets overwritten via qml data
        }
    }


}
