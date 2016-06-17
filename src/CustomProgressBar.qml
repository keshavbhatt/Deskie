import QtQuick 2.0

Rectangle {
    id: body
    color: "black"


    property alias prg: progress
    property int max_value: 0
    property int downloaded:   0
    property int value: 0
    property alias speed: text_download_speed.text
    function setValue(val){
        var wid = (val / max_value) * body.width;
        progress.width = wid;
        downloaded = (val/1024)
    }

    Rectangle {
        id: progress
        height: body.height
        width: (value / max_value) * body.width
        color: "#5060B6"
        clip:true
    }


    Text {
        clip:true
        id: text_download_speed
        text: "NaN"
        visible: false
    }


    Text {
        clip:true
        text:"Downloaded "+downloaded + " Kb of "+  max_value / (1024)/(1024) +" Mb @ " + text_download_speed.text+" kB/s"
        anchors.bottomMargin: 10
        anchors {
            left: progress.left
            verticalCenter: progress.verticalCenter
            margins: 10
        }
        color: "white"
        font.pointSize: 10
    }


}
