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
            text: "First Floor"
            color:"white"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  24
        }
    }

    ChBeButtonsZip{
        id:btnBoxSleep
        x:536
        y:48
        boxTextH: 24
        boxButtonsH: 64
        boxW: 264
        boxHead: "Sleeping Room"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.zipButtonSleep(0)
        onClickedUp: ctrlbridge.zipButtonSleep(1)
        onClickedDwn: ctrlbridge.zipButtonSleep(2)
        onTimeOutUp: ctrlbridge.zipButtonSleep(-1)
        onTimeOutDwn: ctrlbridge.zipButtonSleep(-2)
    }

    ChBeButtonsZip{
        id:btnBoxPrincess
        x:268
        y:48
        boxTextH: 24
        boxButtonsH: 64
        boxW: 264
        boxHead: "Princesses Room"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.zipButtonPrincess(0)
        onClickedUp: ctrlbridge.zipButtonPrincess(1)
        onClickedDwn: ctrlbridge.zipButtonPrincess(2)
        onTimeOutUp: ctrlbridge.zipButtonPrincess(-1)
        onTimeOutDwn: ctrlbridge.zipButtonPrincess(-2)
    }

    ChBeButtonsZip{
        id:btnBoxMessy
        x:0
        y:48
        boxTextH: 24
        boxButtonsH: 64
        boxW: 264
        boxHead: "Messy Room"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.zipButtonMessy(0)
        onClickedUp: ctrlbridge.zipButtonMessy(1)
        onClickedDwn: ctrlbridge.zipButtonMessy(2)
        onTimeOutUp: ctrlbridge.zipButtonMessy(-1)
        onTimeOutDwn: ctrlbridge.zipButtonMessy(-2)
    }
    Rectangle{
        id:headlineII
        width: 800
        height: 48
        x: 0
        y: headlineI.height + btnBoxMessy.boxTextH + btnBoxMessy.boxButtonsH + 8
        color: "black"

        border.color: "black"
        border.width: 1
        radius: 4
        antialiasing:false
        Text {
            id: infotextII
            anchors.centerIn: parent
            text: "Ground Floor"
            color:"white"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  24
        }
    }
    ChBeButtonsJal{
        id:btnJalI
        x:0
        y:headlineII.y+headlineII.height
        boxTextH: 24
        boxButtonsH: 112
        boxW: 264
        boxHead: "Terrace Door"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.jalButtonTerrace(0)
        onClickedUp: ctrlbridge.jalButtonTerrace(1)
        onClickedDwn: ctrlbridge.jalButtonTerrace(2)
        onTimeOutUp: ctrlbridge.jalButtonTerrace(-1)
        onTimeOutDwn: ctrlbridge.jalButtonTerrace(-2)
        onLamUp: ctrlbridge.jalButtonTerrace(3)
        onLamDwn: ctrlbridge.jalButtonTerrace(4)

        onLamUpOut: ctrlbridge.jalButtonTerrace(-3)
        onLamDwnOut: ctrlbridge.jalButtonTerrace(-4)
    }
    ChBeButtonsJal{
        id:btnJalII
        x:268
        y:headlineII.y+headlineII.height
        boxTextH: 24
        boxButtonsH: 112
        boxW: 264
        boxHead: "All Ground"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.jalButtonAll(0)
        onClickedUp: ctrlbridge.jalButtonAll(1)
        onClickedDwn: ctrlbridge.jalButtonAll(2)
        onTimeOutUp: ctrlbridge.jalButtonAll(-1)
        onTimeOutDwn: ctrlbridge.jalButtonAll(-2)
        onLamUp: ctrlbridge.jalButtonAll(3)
        onLamDwn: ctrlbridge.jalButtonAll(4)

        onLamUpOut: ctrlbridge.jalButtonAll(-3)
        onLamDwnOut: ctrlbridge.jalButtonAll(-4)
    }
    ChBeButtonsJal{
        id:btnJalIII
        x:536
        y:headlineII.y+headlineII.height
        boxTextH: 24
        boxButtonsH: 112
        boxW: 264
        boxHead: "Eating Space"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.jalButtonEating(0)
        onClickedUp: ctrlbridge.jalButtonEating(1)
        onClickedDwn: ctrlbridge.jalButtonEating(2)
        onTimeOutUp: ctrlbridge.jalButtonEating(-1)
        onTimeOutDwn: ctrlbridge.jalButtonEating(-2)
        onLamUp: ctrlbridge.jalButtonEating(3)
        onLamDwn: ctrlbridge.jalButtonEating(4)

        onLamUpOut: ctrlbridge.jalButtonEating(-3)
        onLamDwnOut: ctrlbridge.jalButtonEating(-4)
    }
    ChBeButtonsJal{
        id:btnJalIV
        x:536
        y:headlineII.y+headlineII.height +140
        boxTextH: 24
        boxButtonsH: 112
        boxW: 264
        boxHead: "Living Space"
        boxHeadBackColor: "gray"
        durationUp: 2500
        durationDwn: 2500
        onClickedStop: ctrlbridge.jalButtonLiving(0)
        onClickedUp: ctrlbridge.jalButtonLiving(1)
        onClickedDwn: ctrlbridge.jalButtonLiving(2)
        onTimeOutUp: ctrlbridge.jalButtonLiving(-1)
        onTimeOutDwn: ctrlbridge.jalButtonLiving(-2)
        onLamUp: ctrlbridge.jalButtonLiving(3)
        onLamDwn: ctrlbridge.jalButtonLiving(4)

        onLamUpOut: ctrlbridge.jalButtonLiving(-3)
        onLamDwnOut: ctrlbridge.jalButtonLiving(-4)
    }






    ChBeCheckBox{
        id:checker
        cbText : "Automatic"
        cbX: 10
        cbY: 360
        cbWc: 25
        cbWt: 160
        cbH: 25
        cbRad:4
        cbTextSize : 16.0
        onClicked: {
            ctrlbridge.jalCheckBoxAll(checker.checked)
        }
    }
    Rectangle{
        id:tb
        width:80
        height:20
        antialiasing:false
        x:10
        y:404
        color: "#00000000"
        Text{
            id:text
            color:"white"
            text:"Lam. Timing"
            style: Text.Outline
            font.family: "Verdana"
            renderType: Text.NativeRendering
            font.weight:  Font.DemiBold
            font.pointSize:  12.0
        }
    }
    ChBeHSlider{
        id:slide
        slideH: 32
        slideW: 320
        slideX: 140
        slideY: 400
        //onValSliderChanged :root.timeLam(slide.val)
        onValSliderChanged: {
            //root.timeLam(slide.val);
            btnJalII.durationLam = slide.val*2;
            btnJalI.durationLam = slide.val*2;
            btnJalIII.durationLam = slide.val*2;
            btnJalIV.durationLam = slide.val*2;
            ctrlbridge.jalLamTimeAll(btnJalII.durationLam)
        }





    }

}








