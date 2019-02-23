import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id:appl
    visible: true
    width: 800
    height: 450
    x: 0
    y: 0


    flags: Qt.Window | Qt.FramelessWindowHint

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
            HomeSlide {
                hpW: appl.width
                hpH: appl.height
                hpX: 0
                hpY: 0
            }
        }
        Page {
            CtrlSlide {
                hpW: appl.width
                hpH: appl.height
                hpX: 0
                hpY: 0
            }
        }
        Page{
            SwitchSlide {
                hpW: appl.width
                hpH: appl.height
                hpX: 0
                hpY: 0
            }
        }
        Page {
            LogSlide{
                hpW: appl.width
                hpH: appl.height
                hpX: 0
                hpY: 0
            }
        }
        Page {
            StatusSlide{
                hpW: appl.width
                hpH: appl.height
                hpX: 0
                hpY: 0
            }
        }
    }
    footer: TabBar {
        id: tabBar
        height: 12
        currentIndex: swipeView.currentIndex
        TabButton {
            id:tabHome
            ChBeTabText{
                tabText: "HOME"
            }
        }
        TabButton {
            id: tabCtrl
            ChBeTabText{
                tabText: "CONTROL"
            }
        }
        TabButton {
            id: tabSwitch
            ChBeTabText{
                tabText: "SWITCH"
            }
        }
        TabButton {
            id: tabLog
            ChBeTabText{
                tabText: "LOG"
            }
        }
        TabButton {
            id: tabStat
            ChBeTabText{
                tabText: "STATUS"
            }
        }
    }
}

