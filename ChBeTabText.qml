import QtQuick 2.0

Item {
    id:root
    property string tabText : "TheText"
    Text{
        id:text1
        anchors.horizontalCenter: parent.horizontalCenter

        color:"white"
        text:root.tabText
        style: Text.Outline
        font.family: "Verdana"
        renderType: Text.NativeRendering
        font.weight:  Font.DemiBold
        font.pointSize:  8
    }

    anchors.horizontalCenter: parent.horizontalCenter

}
