import QtQuick 2.0

Item {
    id:root
    //Slider Dimensions
    property int slideH: 0
    property int slideW: 0
    property int slideX: 0
    property int slideY: 0
    //Slider Coloring
    property color slideBack: "lightgray"
    property color slideInActive: "lightgray"
    property color slideActive: "lime"
    //Slider Actions
    property int val: 0
    signal valSliderChanged(int val)
    Rectangle{
        width: root.slideW + pill.width
        height: root.slideH
        x: root.slideX
        y: root.slideY
        color: "transparent"
        Rectangle{
            width: root.slideW + pill.width
            height: 4
            x: 0
            y: root.slideH/2 - height/2
            color: root.slideBack
            border.color: "black"
            border.width: 1
        }
        Rectangle{
            id: pill
            width: 32
            height: root.slideH
            x: 0
            y: 0
            color: root.slideInActive
            border.color: "black"
            border.width: 4
            radius: 8
        }
        MouseArea{
            anchors.fill: parent
            preventStealing: true
            onPositionChanged: {
                pill.x = mouse.x
                if(pill.x<0)
                {
                   pill.x = 0
                }
                if(pill.x>(root.slideW))
                {
                   pill.x = root.slideW
                }
                root.val = pill.x * 1000/root.slideW
                root.valSliderChanged(root.val)
            }
            onEntered:{
                pill.color = root.slideActive
                pill.x = mouseX
                if(pill.x<0)
                {
                   pill.x = 0
                }
                if(pill.x>(root.slideW))
                {
                   pill.x = root.slideW
                }
                root.val = pill.x * 1000/root.slideW
                root.valSliderChanged(root.val)
            }
            onReleased: {
                pill.color = root.slideInActive
                root.val = pill.x * 1000/root.slideW
                root.valSliderChanged(root.val)
            }
        }


    }
}
