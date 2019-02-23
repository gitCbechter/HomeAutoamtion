import QtQuick 2.7
import QtQuick.Controls 2.0
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
        gradColorStart: "gray"
        gradColorStop: "#404040"
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
            text: "System Status"
            color:"white"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  24
        }
    }
    ChBeInfoBox{
        id:errCrcCnt
        infoH: 100
        infoW: 360
        infoX: 0
        infoY: 48
        infoHeadBackColor: "gray"
        infoValBackColor: "#C0c0C0"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 12
        infoValSize : 32

        infoHead : "CRC Error counter"
        infoVal : "XXX"
        Connections {
            target: statusbridge
            onSendCommunicationErrorCount: {
                errCrcCnt.infoVal = commErrCnt
            }            
        }
    }
    ChBeInfoBox{
        id:errTimeOutCnt
        infoH: 100
        infoW: 360
        infoX: 440
        infoY: 48
        infoHeadBackColor: "gray"
        infoValBackColor: "#C0c0C0"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 12
        infoValSize : 32

        infoHead : "Timeout Error counter"
        infoVal : "XXX"
        Connections {
            target: statusbridge
            onSendTimeOutErrorCount: {
                errTimeOutCnt.infoVal = timeOutErrCnt
            }
        }
    }

}
