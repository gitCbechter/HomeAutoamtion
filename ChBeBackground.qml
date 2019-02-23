import QtQuick 2.0

Item {
    id:root
    //Background Dimensions
    property int bagrW: 0
    property int bagrH: 0
    property int bagrX: 0
    property int bagrY: 0
    //Background Coloring
    property color gradColorStart: "white"
    property color gradColorStop: "gray"
    Rectangle{
        antialiasing:true
        width:root.bagrW
        height:root.bagrH

        x:root.bagrX
        y:root.bagrY

        gradient: Gradient {
                GradientStop { position: 0.0; color: root.gradColorStart}
                GradientStop { position: 1.0; color: root.gradColorStop }
        }

        border.color: "black"
        border.width: 1

    }
}
