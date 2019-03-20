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
        gradColorStart: "white"
        gradColorStop: "black"
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


    Rectangle{
        id:tb
        width:80
        height:20
        antialiasing:false
        x:10
        y:184
        color: "#00000000"
        Text{
            id:text
            color:"white"
            text:"Jal. Timing"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  12.0
        }
    }
    ChBeHSlider{
        id:slideJalTiming
        slideH: 32
        slideW: 480
        slideX: 140
        slideY: 180
        //onValSliderChanged :root.timeLam(slide.val)
        onValSliderChanged: {
            statusbridge.jalTimingAll(slideJalTiming.val*30)//-> 0s .. 30s
        }
        Connections {
            target: statusbridge
            onUpdateSliderJal: {
                slideJalTiming.val = val/30
            }
        }

    }
    ChBeInfoBox{
        id:valJalTime
        infoH: 52
        infoW: 100
        infoX: 680
        infoY: 170
        infoHeadBackColor: "#404040"
        infoValBackColor: "#808080"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 8
        infoValSize : 12

        infoHead : "Jal. Time"
        infoVal : "XXX"
        Connections {
            target: statusbridge
            onSendTimeJal: {
                valJalTime.infoVal = timeJal
            }
        }
    }

    Rectangle{
        id:tbZ
        width:80
        height:20
        antialiasing:false
        x:10
        y:244
        color: "#00000000"
        Text{
            id:textZ
            color:"white"
            text:"Zip Timing"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  12.0
        }
    }
    ChBeHSlider{
        id:slideZipTiming
        slideH: 32
        slideW: 480
        slideX: 140
        slideY: 240
        //onValSliderChanged :root.timeLam(slide.val)
        onValSliderChanged: {
            statusbridge.zipTimingAll(slideZipTiming.val*30)//-> 0s .. 30s
        }
        Connections {
            target: statusbridge
            onUpdateSliderZip: {
                slideZipTiming.val = val/30
            }
        }

    }
    ChBeInfoBox{
        id:valZipTime
        infoH: 52
        infoW: 100
        infoX: 680
        infoY: 230
        infoHeadBackColor: "#404040"
        infoValBackColor: "#808080"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 8
        infoValSize : 12

        infoHead : "Zip Time"
        infoVal : "XXX"
        Connections {
            target: statusbridge
            onSendTimeZip: {
                valZipTime.infoVal = timeZip
            }
        }
    }
    Rectangle{
        id:windTbJal
        width:80
        height:20
        antialiasing:false
        x:10
        y:304
        color: "#00000000"
        Text{
            id:textWindJal
            color:"white"
            text:"Jal.Wind cm/s"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  12.0
        }
    }
    ChBeHSlider{
        id:slideJalWind
        slideH: 32
        slideW: 480
        slideX: 140
        slideY: 300
        //onValSliderChanged :root.timeLam(slide.val)
        onValSliderChanged: {
            statusbridge.jalWind(slideJalWind.val*2)//-> 0s .. 30s
        }
        Connections {
            target: statusbridge
            onUpdateSliderJalWind: {
                slideJalWind.val = val/2
            }
        }

    }
    ChBeInfoBox{
        id:valJalWind
        infoH: 52
        infoW: 100
        infoX: 680
        infoY: 290
        infoHeadBackColor: "#404040"
        infoValBackColor: "#808080"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 8
        infoValSize : 12

        infoHead : "Jal. Wind"
        infoVal : "XXX"
        Connections {
            target: statusbridge
            onSendWindJal: {
                valJalWind.infoVal = windJal
            }
        }
    }
    Rectangle{
        id:windTbZip
        width:80
        height:20
        antialiasing:false
        x:10
        y:364
        color: "#00000000"
        Text{
            id:textWindZip
            color:"white"
            text:"ZipWind cm/s"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  12.0
        }
    }
    ChBeHSlider{
        id:slideZipWind
        slideH: 32
        slideW: 480
        slideX: 140
        slideY: 360
        //onValSliderChanged :root.timeLam(slide.val)
        onValSliderChanged: {
            statusbridge.zipWind(slideZipWind.val*2)//-> 0s .. 30s
        }
        Connections {
            target: statusbridge
            onUpdateSliderZipWind: {
                slideZipWind.val = val/2
            }
        }

    }
    ChBeInfoBox{
        id:valZipWind
        infoH: 52
        infoW: 100
        infoX: 680
        infoY: 350
        infoHeadBackColor: "#404040"
        infoValBackColor: "#808080"
        infoHeadTextColor: "white"
        infoValTextColor: "white"

        infoHeadSize : 8
        infoValSize : 12

        infoHead : "Zip Wind"
        infoVal : "XXX"
        Connections {
            target: statusbridge
            onSendWindZip: {
                valZipWind.infoVal = windZip
            }
        }
    }

}
