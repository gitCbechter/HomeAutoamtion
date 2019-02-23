import QtQuick 2.0

Item {
    id: root
    //CheckBox Dimensions
    property int cbWc: 20
    property int cbWt: 120
    property int cbH: 20
    property int cbRad:4
    property int cbX: 0
    property int cbY: 0
    //CheckBox Appearance
    property string textColor : "white"
    property string cbText : "TheText"
    property real cbTextSize : 12.0
    //CheckBox Coloring
    property color borderColor: "black"
    property int borderWidth: 2
    //CheckBox Actions
    property bool checked: false
    signal clicked(int val)

    Rectangle{
        id:rect
        width:root.cbWc + root.cbWt
        height:root.cbH
        antialiasing:false
        x:root.cbX
        y:root.cbY
        color: "#00000000"
        MouseArea{
            id:ma
            anchors.fill: parent
            onClicked: {
                checked = !checked;
                root.clicked(checked);//dummy gets overwritten via qml data
            }
        }
        Rectangle{
            id:box
            width:root.cbWc
            height:root.cbH
            radius:root.cbRad
            antialiasing:false
            x:0
            y:0
            border.color: root.borderColor
            border.width: root.borderWidth


            Image{
                anchors.fill: parent
                anchors.margins: root.borderWidth
                source: "checked.png"
                visible: checked
            }
        }
        Rectangle{
            id:tb
            width:root.cbWt
            height:root.cbH
            antialiasing:false
            x:root.cbWc + 4
            y:0
            color: "#00000000"
            Text{
                id:text
                //anchors.centerIn: parent
                //anchors.bottom: parent.bottom
                //anchors.horizontalCenter: parent.left
                //anchors.bottomMargin: root.cbWc/10
                color:root.textColor
                text:root.cbText
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  root.cbTextSize
            }
        }
    }
}
