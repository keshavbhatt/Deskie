import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1 as Q
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.1
import Qt.labs.folderlistmodel 1.0
import QtQuick.LocalStorage 2.0
import "storage.js" as Storage

//mut modules
import Mut 0.1
import Mut.Styles 0.1
import Mut.Themes 0.1
import Mut.Layouts 0.1
import Mut.ListItems 0.1


import Downloader 1.0;


ApplicationWindow { id: app

    function nextrandWall() {
         downloader.nextrandWall();
    }
    function nextWall() {
         downloader.nextWall();
    }
    function prevWall() {
         downloader.prevWall();
    }
    function slideShow() {
         slideshow_checkbox_bool=true
         downloader.slidShow();
        console.log(slideshow_checkbox_bool+"asdfghasfdghjkdgfhjsfgdfghjdfghjdfgh")
    }
    function stopSlideShow() {
        if(slideshow_checkbox_bool){
         slideshow_checkbox_bool=false
        console.log(slideshow_checkbox_bool+"dfghjdfghjdfgh")}
        else {
        slideshow_checkbox_bool=true
        }
    }

    property string base_url: "http://thepaperwall.com/"
    property string current_cat: "rss.recentfifty.php"
    property string current_category: "http://thepaperwall.com/rss.category.php?feed="
    property string catname: "girls"
    property bool home: true

    property bool is_downloading: false

    property bool offlinedata: false
    property bool  slideshow_checkbox_bool: false
    property string social: "facebook"
    property int timer_time: 30000
    property bool option_visible: false
    property bool about_visible: false





    width: Screen.width
    height:Screen.height
    title: qsTr("Deskie App")
    visible: true

    pageStack.initialItem: homee
    pageStack.onCurrentItemChanged: drawer.close()
    pageStack.focus: !drawer.opened

    Component.onCompleted: {
        Theme.imageAssetsPath = "qrc:///icons/"
    }

    property list<Action> actions: [
        Action {
            id:act1
            text: "Latest"
            iconSource: Qt.resolvedUrl("./icons/apps.svg")
            onTriggered: {
                home=true ; drawer.close();
               model.source=base_url+current_cat
            }
        },
        Action {
            text: "Animals"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname = "animals"
            }
        },
        Action {
            text: "Architecture"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname = "architecture"
            }
        },
        Action {
            text: "Bikes"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname = "bikes"
            }
        },
        Action {
            text: "Cars"
            iconSource: act1.iconSource
            onTriggered: {
             home=false ; drawer.close();
             catname = "cars"
            }
        },
        Action {
            text: "Cartoon/Comic"
            iconSource: act1.iconSource
            onTriggered: {
            home=false ; drawer.close();
            catname="cartoon_comic"
            }
        },
        Action {
            text: "CityScape"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="cityscape"
            }
        },
        Action {
            text: "Computer/Tech"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="computer_tech"
            }
        },
        Action {
            text: "Digital/Artwork"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="digital_artwork"
            }
        },
        Action {
            text: "Dual Monitor"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="duel_monitor"
            }
        },
        Action {
            text: "Fantasy"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="fantasy"
            }
        },
        Action {
            text: "Food/Drink"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="food_drink"
            }
        },
                Action {
                    text: "Girls"
                    iconSource: act1.iconSource
                    onTriggered: {
                        home=false ; drawer.close();
                        catname="girls"
                    }
                },
                Action {
                    text: "Guns"
                    iconSource: act1.iconSource
                    onTriggered: {
                        home=false ; drawer.close();
                        catname="guns"
                    }
                },
                Action {
                    text: "Holiday"
                    iconSource: act1.iconSource
                    onTriggered: {
                        home=false ; drawer.close();
                        catname="holiday"
                    }
                },
        Action {
            text: "Humor"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="humor"
            }
        },
        Action {
            text: "Industrial"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="industrial"
            }
        },
        Action {
            text: "Informational"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="informational"
            }
        },
        Action {
            text: "Insect"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="insects"
            }
        },
        Action {
            text: "iPhone/Mobile"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="iphone_mobile"
            }
        },
        Action {
            text: "Love/Hate"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="love_hate"
            }
        },
        Action {
            text: "Misc"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="misc"
            }
        },
        Action {
            text: "Music"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="music"
            }
        },
        Action {
            text: "Movies"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="movies"
            }
        },
        Action {
            text: "Nature"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="nature"
            }
        },
        Action {
            text: "People"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="people"
            }
        },
        Action {
            text: "Quotes/Worded"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="quotes_worded"
            }
        },
        Action {
            text: "Sci-Fi"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="sci-fi"
            }
        },
        Action {
            text: "Science"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="science"
            }
        },
        Action {
            text: "Space"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="space"
            }
        },
        Action {
            text: "Sports"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="sports"
            }
        },
        Action {
            text: "Television"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="television"
            }
        },
        Action {
            text: "Video Games"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="video_games"
            }
        },
        Action {
            text: "Vintage/Historical"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="vintage_historical"
            }
        },
        Action {
            text: "War/Military"
            iconSource: act1.iconSource
            onTriggered: {
                home=false ; drawer.close();
                catname="war_military"
            }
        }]


    Downloader{
        id:downloader
    }

    Timer {
           id: elapsedTimer
           interval: timer_time
           running: slideshow_checkbox_bool?true:false
           repeat: true
           triggeredOnStart: true
           onTriggered:{
//                console.log(slideshow_checkbox_bool)
              if(slideshow_checkbox_bool){
                  downloader.slidShow();
                  restart();
              }

           }
       }

    NavDrawer {
        id: drawer
        focus: drawer.opened

        ListView {
            anchors.fill: parent
            model: app.actions

            delegate: SingleLineItem {
                text: model.text
                primaryAction: modelData
            }
        }

    }

    Component {
        id: homee

        Page {id:homepage


            MouseArea{
                anchors.fill: parent
                onClicked:console.log("dont  do it")
            }

            function downloadProgress(downloaded_size, max_size) {
                progress_bar.max_value = max_size
                progress_bar.setValue(downloaded_size)


            }
            function downloadFinished() {
                startDownloading(false)
                is_downloading = false
                progress_bar.max_value = 0
                progress_bar.setValue(0)
                progress_bar.speed=0
                progress_bar.prg.width=0
                downloader.check_file(q.text)


               // console.log("updating")//update model after download
                _ListView.model=fakemodel;
                _ListView.model=folderModel

            }

            function downloadSpeed(kb_s) {
                progress_bar.speed = kb_s
            }


            //show no internet
            function downloadError(err) {
                if (err===5||0){
                   // console.log("0,5")
                }
            else{
                pl_1.start();
                }
                //console.log(err)
                startDownloading(false)
                is_downloading = false
            }

            function startDownloading(status) {
                    if (status) {
                         downloader.downloadUrl(q.text)

                        //console.log(q.text)
                    } else {
                        is_downloading = false

                    }
                }

            function sendFileurl(url){
                downloader.imageurl(url)
            }

            function file_exists_(){
                file_exists.visible = true;
            }
            function file_not_exists_(){
                file_exists.visible = false;
            }

            function started_download(){
                is_downloading =true
            }

            function sendPictureOption(option){
                downloader.change_picture_option(option)

            }

            function downlaodfolder(optison){

               folderModel.folder="file://"+optison
//               console.log("damndamndamnadmnadmnad-----" + optison)
            }

            ListModel {
                   id: fakemodel
                   ListElement { filePath: "zoom";fileName: "centered"}

               }

            Component.onCompleted: {

                if(Storage.get("current_option") <= -1 ){
                Storage.set("current_option" , "0")}

                if(Storage.get("current_option_icon") <= -1 ){
                Storage.set("current_option_icon" , "0")}


                //get
                var k=  Storage.get("current_option","0");
                option_input.currentIndex = k ;

                var j=  Storage.get("current_option_icon","0");
                option_input2.currentIndex = j ;


                downloader.downloadF.connect(downlaodfolder )

                downloader.progress.connect(downloadProgress)
                downloader.finished.connect(downloadFinished)
                downloader.file_existss.connect(file_exists_)
                downloader.file_not_existss.connect(file_not_exists_)
                downloader.speed.connect(downloadSpeed)
                downloader.download_startedd.connect(started_download)
                downloader.downloadError.connect(downloadError)


                downloader.setOfflineDir();

             }



            Text {
                id: q
                text: ""
                visible: false
               // onTextChanged: console.log(text)
            }



            property alias index: listview.currentIndex

            title: qsTr("Recently added Wallpapers")


            Rectangle{
                id:option_dialog
                anchors.right: parent.right
                width: 200
                color:"#3F51B5"
                z:5
                opacity: {
                    if (option_visible){
                        0.7
                    } else {
                        0.0
                    }
                }
                height: {
                    if (option_visible) {
                        option_input.height+option_input2.height+slideshow_checkbox.height+timer_tim.height+30
                    } else {
                        0
                    }
                }

                    Behavior on height {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.Linear
                    }
                }

                ComboBox {
                    width: parent.width-10
                    height:30

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.topMargin: 10
                    id:option_input
                    model:cbItems
                     ListModel {
                            id: cbItems
                            ListElement { text: "zoom" }
                            ListElement { text: "centered"}
                            ListElement { text: "scaled"}
                            ListElement { text: "wallpaper"}
                            ListElement { text: "stretched"}
                            ListElement { text: "spanned"}

                        }

                    onCurrentIndexChanged: {
                        var k =  currentIndex
                        Storage.set("current_option", k)

                          var option = option_input.model.get(currentIndex).text
                        sendPictureOption(option);
                    }
                    style: ComboBoxStyle {
                            id: comboBox
                            background: Rectangle {
                                id: rectCategory
                                width: 200
                                color: "#3F51B5"
                                opacity: 0.8
                            }
                            label: Text {
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 15
                                font.capitalization: Font.SmallCaps
                                color: "white"
                                text: control.currentText
                            }



                        }
                    scale: option_visible ? 1: 0
                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.OutElastic
                            duration: 800
                        }}

                }

                ComboBox {
                    width: parent.width-10
                    height:30

                    anchors.top:option_input.bottom
                    anchors.topMargin: 5
                    id:option_input2
                    model:cbItems2
                    anchors.horizontalCenter: parent.horizontalCenter
                     ListModel {
                            id: cbItems2
                            ListElement { text: "icons on desktop" }
                            ListElement { text: "no icon on desktop"}
                        }


                    style: ComboBoxStyle {
                            id: comboBox2
                            background: Rectangle {
                                id: rectCategory2
                                width: 200
                                color: "#3F51B5"
                                opacity: 0.8
                            }
                            label: Text {
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 15
                                font.capitalization: Font.SmallCaps
                                color: "white"
                                text: control.currentText
                            }

                        }
                    onCurrentIndexChanged: {
                        var k =  currentIndex
                        Storage.set("current_option_icon)", k)
                        var option ;
                        if(currentIndex===0)option="icon";
                        if(currentIndex===1)option="no_icon";
                        sendPictureOption(option);
                    }
                    scale: option_visible ? 1: 0
                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.OutElastic
                            duration: 800
                        }}
                }

                CheckBox{

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: option_input2.bottom
                    anchors.topMargin: 5
                    width: parent.width-10
                    id:slideshow_checkbox

                    text: "run slidshow"
                    checked: slideshow_checkbox_bool
                    onCheckedChanged: {
                        if(checked) slideshow_checkbox_bool=true
                        if(!checked) slideshow_checkbox_bool=false
                    }
                    style: CheckBoxStyle {
                            id: comboBox23
                            background: Rectangle {
                                id: rectCategory23
                                color: "#3F51B5"
                                anchors.margins: 20
                                height:40
                                opacity: 0.8

                            }
                            indicator:Image {
                                id: ghj
                                source: "icons/check.svg"
                                height:30
                                width:15


                                Rectangle{
                                    anchors.fill: parent
                                    color:"white"
                                    visible: control.checked
                                }
                            }
                            label: Text {
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 15
                                font.capitalization: Font.SmallCaps
                                color: "white"
                                text: control.checked ? "stop slidshow" : slideshow_checkbox.text
                                verticalAlignment: Text.AlignVCenter

                            }

                        }
                    scale: option_visible ? 1: 0
                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.OutElastic
                            duration: 800
                        }}
                }

                ComboBox {
                    width: parent.width-10
                    height:30

                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.top:slideshow_checkbox.bottom
                    anchors.topMargin: 10
                    id:timer_tim
                    enabled: slideshow_checkbox_bool?false:true
                    model:cbItemss
                     ListModel {
                            id: cbItemss
                            ListElement { text: "20 Sec"
                                time:20000}
                            ListElement { text: "30 Sec"
                                time:30000}
                            ListElement { text: "1 Min"
                                time:60000}
                            ListElement { text: "3 Min"
                                time:180000}
                            ListElement { text: "5 Min"
                                time:300000}
                            ListElement { text: "10 min"
                                time:600000}
                            ListElement { text: "15 Min"
                                time:900000}
                            ListElement { text: "20 Min"
                                time:1200000}
                            ListElement { text: "30 Min"
                                time:1800000}
                            ListElement { text: "1 Day"
                                time:86400000}
                        }

                    onCurrentIndexChanged: {
                          var k=timer_tim.model.get(currentIndex).time
                          timer_time = k;
                    }
                    style: ComboBoxStyle {
                            id: comboBoxx
                            background: Rectangle {
                                id: rectCategoryy
                                width: 200
                                color: "#3F51B5"
                                opacity: 0.8
                            }
                            label: Text {
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 15
                                font.capitalization: Font.SmallCaps
                                color: "white"
                                text: control.currentText
                            }



                        }
                    scale: option_visible ? 1: 0
                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.OutElastic
                            duration: 800
                        }
                    }

                }


            }


//refresh


            //about dialog
            Rectangle{
                id:about_dialog
                anchors.right: parent.right
                width: 300
                color:"#3F51B5"
                z:5
                opacity: {
                    if (about_visible){
                        0.7
                    } else {
                        0.0
                    }
                }
                height: {
                    if (about_visible) {
                         me.height+id.height+website.height+product.height+social_row.height+id2.height+80
                    } else {
                        0
                    }
                }

                    Behavior on height {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.Linear
                    }
                }

                Image {
                    id: me
                    anchors.top:parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "images/me.jpg"
                    width: 200
                    height: 200
                    scale:about_visible? 1:0
                    opacity:about_visible? 1:0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.Linear
                        }
                    }
                }

                Text {
                    id: id
                    text: qsTr("Developed by : Keshav Bhatt")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:me.bottom
                    anchors.topMargin: 10
                    scale:about_visible? 1:0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                }
                Text {
                    id: id2
                    text: qsTr("Version : 1.0")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:id.bottom
                    anchors.topMargin: 10
                    scale:about_visible? 1:0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                }

                 Q.Button{
                    id:website
                     z: about_visible?5:0
                    style: RaisedButtonStyle {
                    }
                    text:"Website"
                    onClicked:downloader.openWebsite();
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:id2.bottom
                    anchors.topMargin: 5
                    scale:about_visible? 1:0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                }
                 Q.Button{
                    id:product
                    style: RaisedButtonStyle {
                    }
                     z: about_visible?5:0
                    text:"Get Ubuntu Play Store"
                    onClicked:downloader.getPlayStore();
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:website.bottom
                    anchors.topMargin: 10
                    scale:about_visible? 1:0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                }

                Row{id:social_row
                    spacing: 10
                     z: about_visible?5:0
                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.top:product.bottom
//                    anchors.topMargin: 15
                    Image {
                        id: name2
                         z: about_visible?5:0
                        source: "icons/f.png"
                        scale: f.pressed ? 1.4: 1
                        MouseArea{
                            id:f
                            anchors.fill: parent
                            onClicked: downloader.social("f");
                        }
                        Behavior on scale {
                            NumberAnimation {
                                easing.type: Easing.OutElastic
                                duration: 800

                            }
                        }
                    }
                    Image {
                        id: name3
                        z: about_visible?5:0
                        source: "icons/t.png"
                        scale: t.pressed ? 1.4: 1
                        MouseArea{
                            id:t
                            anchors.fill: parent
                            onClicked: downloader.social("t");
                        }
                        Behavior on scale {
                            NumberAnimation {
                                easing.type: Easing.OutElastic
                                duration: 800

                            }
                        }
                    }
                    Image {
                        id: name4
                         z: about_visible?5:0
                        source: "icons/g.png"
                         scale: g.pressed ? 1.4: 1
                        MouseArea{
                            id:g
                            anchors.fill: parent
                            onClicked: downloader.social("g");
                        }
                        Behavior on scale {
                            NumberAnimation {
                                easing.type: Easing.OutElastic
                                duration: 800

                            }
                        }
                    }
                    y:about_visible? parent.height-60:parent.height
                    Behavior on y {
                        NumberAnimation {
                            easing.type: Easing.OutElastic
                            duration: 800

                        }
                    }
                    scale: about_visible ? 1: 0
                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.Linear
                            duration: 800
                        }
                    }
                }

MouseArea{anchors.fill: parent
    hoverEnabled: true
}


            }







            Rectangle {
                id: root
                  clip: true
                 color:"#3F51B5"
                z:5
                anchors.right: parent.right
                opacity: {
                    if (offlinedata){
                        0.9
                    } else {
                       0.0
                    }
                }
                width: {
                    if (offlinedata) {
                        300
                    } else {
                        0
                    }
                }
                height: {
                    if (offlinedata) {
                       parent.height
                    } else {
                        0
                    }
                }

                    Behavior on width {
                        NumberAnimation {
                            duration: 250
                            easing.type: Easing.InOutQuad
                        }
                    }
                Behavior on opacity {
                    NumberAnimation {
                        duration: 50
                        easing.type: Easing.Linear
                    }
                }
                Behavior on height {
                    NumberAnimation {
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }

                FolderListModel{
                                       id: folderModel
                                       sortField: FolderListModel.Time
                                      // folder: "file://"+downloader
                                       showDirs: false
                                       showOnlyReadable: true
                                       nameFilters: ["*.jpg"]

                                   }

                ScrollBar {
                    id:lol
                    scrollArea: _ListView
                    height: _ListView.height
                    width: 7
                    anchors.right: _ListView.right
                }

                ListView {
                    id: _ListView
                    anchors.fill: parent

                    cacheBuffer:200

                    delegate: Rectangle {
                        id: _Rectangle_Delegate
                        property string title : model.fileName
                        width: ListView.view.width-lol.width
                        height: 200
                        color:"#3F51B5"
                        Rectangle {
                            anchors.fill: parent
                            color:"#3F51B5"
                            anchors.centerIn: parent;


                            Rectangle{
                                id:bule_wrapper
                                width: _Image.width
                                height:_Image_ma.containsMouse? _Image.height : 0
                                opacity: _Image_ma.containsMouse? 0.5 : 0
                                color:"#3F51B5"

                                anchors.fill: parent
//                                visible:_Image_ma.containsMouse ? true :false
                                z:_Image_ma.containsMouse? 8 : 0
                                Behavior on opacity {
                                    NumberAnimation {
                                        duration: 300
                                        easing.type: Easing.Linear
                                    }
                                }
                                Behavior on height {
                                    NumberAnimation {
                                        duration: 500
                                        easing.type: Easing.Linear
                                    }
                                }

                                Text {
                                    id: setwall
                                    text: qsTr("Set WallPaper")
                                    font.pixelSize: 32
                                    anchors.centerIn: parent
                                    color:"white"
                                    font.capitalization:   Font.MixedCase

                                }
                            MouseArea{
                                id:damnfuck
                                anchors.fill: parent
                                onClicked:{
                                var url = _Image.source
                                    sendFileurl(url)

                                }
                            }
                            }

                                Image {
                                    id: _Image
                                    width: parent.width
                                    opacity: 0.8
                                    height: 200
                                    fillMode: Image.PreserveAspectCrop
                                    source:  "file://"+filePath
                                    smooth: false
                                    cache: false
                                    asynchronous: true


                                    NumberAnimation on scale {
                                         id: createAnimation32
                                         from: 0
                                         to: 1
                                         duration: 400
                                     }


                                     Component.onCompleted:{
                                         createAnimation32.start()

                                     }
                                     scale: damnfuck.pressed ? 1.4: 1
                                     Behavior on scale {
                                         NumberAnimation {
                                             easing.type: Easing.OutElastic
                                             duration: 800

                                         }
                                     }
                                     MouseArea{
                                         id:_Image_ma
                                         hoverEnabled: true
                                         anchors.fill:parent
                                         onClicked: {


                                         }
                                     }
                                }



                        }

                    }
                }
            }


















            Image {
                id: name
                source: "images/main_bg.png"
                 fillMode: Image.Tile
                anchors.fill: parent
                z: 0
                NumberAnimation on opacity {
                     id: createAnimation3
                     from: 0
                     to: 1
                     duration: 200
                 }
                 Component.onCompleted: createAnimation3.start()
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {}
                 }
            }

            Rectangle {
                  id: wrapper
               // anchors.centerIn: parent
                y:15
                anchors.horizontalCenter:  parent.horizontalCenter
                width: monitor.width
                height: monitor.height
                color: "transparent"

                Rectangle {
                    id: inner_wraapper_shadow
                    z: 1
//mouse_in_image.containsMouse || btn_ma.containsMouse||btn_ma.pressed ||opn_img_btn_ma.containsMouse||btn_cancel_ma.containsMouse
//mouse_in_image.containsMouse  || btn_ma.containsMouse ||btn_ma.pressed||opn_img_btn_ma.containsMouse||btn_cancel_ma.containsMouse
                    opacity: {
                        if (is_downloading||mouse_in_image.containsMouse || btn_ma.containsMouse||btn_ma.pressed ||opn_img_btn_ma.containsMouse||btn_cancel_ma.containsMouse
) {
                            0.7
                        } else {
                            0.0
                        }
                    }
                    scale: {
                        if (1==1) {
                            1
                        } else {
                            0
                        }
                    }

//                    Behavior on scale {
//                        NumberAnimation {
//                            duration: 300
//                            easing.type: Easing.Linear
//                        }
//                    }
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 300
                            easing.type: Easing.Linear
                        }
                    }
                    smooth: mouse_in_image.containsMouse
                    color: "black"
                    width: 567-39
                    height: 358-28
                    x: monitor.x + 18
                    y: monitor.y + 22

                    Label{
                        id:network_error
                        text: "No Internet"
                        anchors.bottom: downloading.top
                        anchors.bottomMargin: 20
                        font.pixelSize: 15
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        opacity: 0


                    }


                        NumberAnimation {
                            id:pl_1
                            target: network_error
                            property: "opacity"
                            from: 1.0
                            to:0.0
                            duration: 5000
                            easing.type: Easing.Linear
                        }


                    Label{
                        id:downloading
                        text: "Downloading"
                        anchors.bottom: progress_bar.top
                        anchors.bottomMargin: 20
                        font.pixelSize: 15
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        visible:  is_downloading ? true :false
                    }


                    CustomProgressBar{
                        id: progress_bar
                        width: parent.width-100
                        height:30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 20
                        anchors.bottom: btn_cancel.top
                        visible: is_downloading ? true :false
                    }

                    Q.Button {
                        id: btn_cancel
                        text: "Cancel"
                        style: RaisedButtonStyle {
                        }
                        z: 3
                        visible: is_downloading ? true :false
                        anchors.bottomMargin: 20
                        anchors.bottom:file_exists.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            id: btn_cancel_ma
                            onClicked: {
                           downloader.downloadCancel();
                                }
                        }
                        opacity: btn_cancel_ma.pressed
                                 && btn_cancel_ma.containsMouse ? 0.7 : 1.0
                        scale: btn_cancel_ma.pressed
                               && btn_cancel_ma.containsMouse ? 0.7 : 1.0
                        Behavior on scale {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutQuad
                            }
                        }
                        Behavior on opacity {
                            NumberAnimation {
                                duration: 30
                                easing.type: Easing.OutQuad
                            }
                        }
                    }


                    Label {
                        id: file_exists
                        text: "Available Offline"
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: btn.top
                        anchors.bottomMargin: 20
                        font.pixelSize: 15
                        color: "white"
                     }

                    Q.Button {
                        id: btn
                        text: "Set Wallpaper"
                        style: RaisedButtonStyle {
                        }
                        z: 3
                        visible: {  if(file_exists.visible && is_downloading){return true}else if(is_downloading) {return false} else{return true}}
                        anchors.bottomMargin: 20
                        anchors.bottom: open_img_btn.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            id: btn_ma
                            onClicked: {

                                var bgurl=bg_thumb.source.toString()
                                if(bgurl.match("php")){
                                    damn.trigger()
                                }
                                else{
                            startDownloading(true)
                                    }
                            }
                        }
                        opacity: btn_ma.pressed
                                 && btn_ma.containsMouse ? 0.7 : 1.0
                        scale: btn_ma.pressed
                               && btn_ma.containsMouse ? 0.7 : 1.0
                        Behavior on scale {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutQuad
                            }
                        }
                        Behavior on opacity {
                            NumberAnimation {
                                duration: 30
                                easing.type: Easing.OutQuad
                            }
                        }
                    }
                    Q.Button {
                        id: open_img_btn
                        text: "Open Wallpaper"
                        style: RaisedButtonStyle {
                        }
                        z: 3
                        visible: file_exists.visible ? true:false
                        anchors.bottomMargin: 30
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            id: opn_img_btn_ma
                            onClicked:{ console.log("opening Image")
                            downloader.openImage(); }

                        }
                        opacity: opn_img_btn_ma.pressed
                                 && opn_img_btn_ma.containsMouse ? 0.7 : 1.0
                        scale: opn_img_btn_ma.pressed
                               && opn_img_btn_ma.containsMouse ? 0.7 : 1.0
                        Behavior on scale {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutQuad
                            }
                        }
                        Behavior on opacity {
                            NumberAnimation {
                                duration: 30
                                easing.type: Easing.OutQuad
                            }
                        }
                    }

                }

                Rectangle {
                    id: inner_wraapper
                    color: "transparent"
                    width: 567-39
                    height: 358-28
                    x: monitor.x + 18
                    y: monitor.y + 22
                    Image {
                        id: bg_thumb
                        source: "images/image.php.jpeg"
                        anchors.fill: parent
                        cache:true
                        asynchronous: true

                        NumberAnimation on opacity {
                             id: createAnimation
                             from: 0
                             to: 1
                             duration: 2000
                         }
                         Component.onCompleted: createAnimation.start()

                         onStatusChanged: { if(bg_thumb.status===Image.Ready)createAnimation.start() }
onSourceChanged: {
    downloader.check_file(q.text)
   }                 }
                    MouseArea {
                        id: mouse_in_image
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }

                //loading wrapper
                Rectangle {
                    id: inner_wraapper_loading
                    color: "transparent"
                    width: 567
                    height: 358
                    visible: bg_thumb.status === Image.Loading ? true :false
                    x: monitor.x + 19
                    y: monitor.y + 22
                   AnimatedImage{
                        id: progress
                        source: "images/progress.gif"
                        anchors.centerIn: parent

                    }

                }

                Image {
                    id: monitor
                    source: "images/monitor_bg.png"
                    height:450
                    width: 562
                }

                Image {
                    id: prev
                    z: 2
                    source: "images/slider_arrow_left.png"
                    x: monitor.x + 18
                    anchors.verticalCenter: inner_wraapper.verticalCenter
                    MouseArea {
                        id: mouse_in_prev
                        anchors.fill: parent
                        onClicked:{ console.log("prev")+listview.currentIndex
                       listview.decrementCurrentIndex()

                        }
                    }
                    opacity: mouse_in_prev.pressed
                             && mouse_in_prev.containsMouse ? 0.7 : 1.0
                    scale: mouse_in_prev.pressed
                           && mouse_in_prev.containsMouse ? 0.8 : 1.0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 40
                            easing.type: Easing.Linear
                        }
                    }
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 30
                            easing.type: Easing.Linear
                        }
                    }
                }
                Image {
                    id: next
                    z: 2
                    anchors.leftMargin: 10
                    source: "images/slide_arrow_right.png"
                    x: monitor.width - 56
                    anchors.verticalCenter: inner_wraapper.verticalCenter
                    MouseArea {
                        id: mouse_in_next
                        anchors.fill: parent
                        onClicked:{ console.log("next"+listview.currentIndex)
                     listview.incrementCurrentIndex() }
                    }
                    opacity: mouse_in_next.pressed
                             && mouse_in_next.containsMouse ? 0.7 : 1.0
                    scale: mouse_in_next.pressed
                           && mouse_in_next.containsMouse ? 0.8 : 1.0
                    Behavior on scale {
                        NumberAnimation {
                            duration: 40
                            easing.type: Easing.Linear
                        }
                    }
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 30
                            easing.type: Easing.Linear
                        }
                    }
                }
            }




/////////////////////////////////////////////////////////////////////////////////////////

            Rectangle{
                id:list_view_wrapper
                height: 153
                width: parent.width
                anchors.topMargin: 40
                anchors.top:wrapper.bottom
                color: "transparent"
                Image {
                    id: adads
                    source: "images/3.png"
                    anchors.fill: parent
                     fillMode: Image.TileHorizontally
                }

                Image {
                    z:5
                    id: left
                    source: "images/slider_arrow_left.png"
                x: parent.x
                anchors.verticalCenter: parent.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: listview.decrementCurrentIndex()
                }
                }
                Image {
                    z:5
                    id: right
                    source: "images/slide_arrow_right.png"
                    x: parent.width-40
                    anchors.verticalCenter: parent.verticalCenter
                    MouseArea{
                        anchors.fill: parent
                        onClicked: listview.incrementCurrentIndex()
                    }
                }

                Rectangle{
                    color: "transparent"
                    width: parent.width-80
                    height: parent.height-10
                    anchors.verticalCenter: parent.verticalCenter
                    x:left.width
                    id:wrap

                    AnimatedImage {
                        id: progress2
                        source: "images/progress.gif"
                        anchors.centerIn: parent
                        visible: model.status === XmlListModel.Loading ? true :false
                    }

                    ScrollBar {
                        scrollArea: listview
                        width:  listview.width
                        height: 10
                        anchors.top: listview.bottom
                        orientation: Qt.Horizontal
                        anchors.topMargin: 5
                    }


                    ListView{

                        id:listview
                        model:model
                        focus: true
                        cacheBuffer: 1000
                        clip: true
                        anchors.fill: parent
                        orientation :ListView.Horizontal
                        highlightMoveDuration: 200
                            Component {
                                id: highlightBar
                                Rectangle {
                                    width: 248; height: 148
                                    color: "#A7A8AC"
                                    x: listview.currentItem.x;
                                    Behavior on x { SpringAnimation { spring: 1; damping: 0.1 } }
                                }
                            }
                        highlight: highlightBar

                        delegate: Rectangle{
                            id:wrapp
                            color: "transparent"
                            height: 144
                            width: 246

                            states: State {
                                           name: "Current"
                                           when: wrap.ListView.isCurrentItem
                                           PropertyChanges { target: wrap; x: 20 }
                                       }
                                       transitions: Transition {
                                           NumberAnimation { properties: "x"; duration: 200 }
                                       }

                            Rectangle {
                                id: inner_wraapper_loading2
                                color: "black"
                                 anchors.centerIn: parent
                                opacity: 0.8
                               //anchors.fill: parent
                                height:parent.height-10
                                width: parent.width -10
                                visible: thumbnail.status === Image.Loading ? true :false
                               AnimatedImage{
                                    id: progress3
                                    source: "images/progress.gif"
                                    anchors.centerIn: parent
                                }
                               NumberAnimation on opacity {
                                    id: createAnimation2
                                    from: 0
                                    to: 1
                                    duration: 2000
                                }
                                Component.onCompleted: createAnimation2.start()
                            }


                            Image {
                                id: thumbnail
                                cache: true
                                asynchronous: true
                                smooth: false
                                source:
                                 {  if(home){
                                        var main =description
                                        var str1 = main.split('src="')
                                        var str2 = str1[1].split('?x=130&y=89&q=85&sig=SVA2qhNVOsYltxwW7ULPyQ--" align="left" height="150" width="240"/')
                                        var str3 = str2[0]
                                        return str3
                                    }
                                    else if(!home){
                                      var  img_thumb ="http://thepaperwall.com/wallpapers/"+catname+"/small/small_"
                                      var str = link.split('view=')
                                      var kk = img_thumb+str[1]+".jpg"
                                      return  kk;}
                                 }
                               // onSourceChanged: console.log(source)
                                height:137
                                width: 240
                                anchors.centerIn: parent
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked:  {
                                        listview.currentIndex=index

                                        if(home){
                                            var main =description
                                            var str1 = main.split('src="')
                                            var str2 = str1[1].split('?x=130&y=89&q=85&sig=SVA2qhNVOsYltxwW7ULPyQ--" align="left" height="150" width="240"/')
                                            var str3 = str2[0]
                                             var str4 = str3.split('small/small_')
                                            var str5 = str4[0]+"big/big_"+str4[1]
                                           // bg_thumb.source =  str5 ;
                                            q.text=str5

bg_thumb.source=thumbnail.source
                                        }

                                        else if(!home){
                                                   var  img_thum ="http://thepaperwall.com/wallpapers/"+catname+"/big/big_" ;
                                                   var str = listview.model.get(listview.currentIndex).link
                                                   var d = str.split('view=');
//                                                  bg_thumb.source = img_thum+d[1]+".jpg";
                                            q.text=img_thum+d[1]+".jpg";
bg_thumb.source=thumbnail.source}
                                    homepage.title= title
//                                        console.log(d[1] )
//                                        console.log(listview.currentIndex)
//                                        console.log(bg_thumb.source)

                                    }

                                }
                                NumberAnimation on opacity {
                                     id: createAnimation5
                                     from: 0
                                     to: 1
                                     duration: 1500
                                 }
                                NumberAnimation on scale {
                                     id: createAnimation5_1
                                     from: 0
                                     to: 1
                                     duration: 700
                                 }
                          onStatusChanged: { if(thumbnail.status===Image.Ready)createAnimation5.start();createAnimation5_1.start() }

                            }

                        }

                        onCurrentIndexChanged: {
                            listview.currentIndex=index

                        }

                    }


                    XmlListModel{
                        namespaceDeclarations: "declare namespace media=\"http://search.yahoo.com/mrss/\";"
                        query: "/rss/channel/item"
                        id:model

                    source:{if(home){return base_url+current_cat }
                        else if(!home){return current_category+catname}
                    }
                        XmlRole {
                        name: "link"
                        query: 'link/string()'
                    }
                    XmlRole {
                        name: "title"
                        query: 'title/string()'
                    }
                    XmlRole {
                        name: "description"
                        query: 'description/string()'
                    }

                    }
                }
}


            navAction: Action {
                iconSource: Qt.resolvedUrl("./icons/hamburger.svg")

                onTriggered: {
                    drawer.toggle()
                }
            }

            actions: [

                Action {
                    iconSource: Qt.resolvedUrl("./icons/info.svg")
                    tooltip: "About Application"
                    onTriggered: {

                            if(!about_visible){about_visible=true}
                             else if (about_visible){about_visible=false}
                         option_visible =false
                            offlinedata=false
                    }

                             },
                Action {
                        iconSource: Qt.resolvedUrl("./icons/reload.svg")
                        tooltip: "Reload"
                        onTriggered: {
                                 model.reload()

                                     }
                                 },

               Action {
                       iconSource: Qt.resolvedUrl("./icons/open.svg")
                       tooltip: "Open Download Directory"
                       onTriggered: {
                                       downloader.openOfflineDir();
                                    }
                                },
                Action {
                    iconSource: Qt.resolvedUrl("./icons/apps.svg")
                    tooltip: "Options"
                    onTriggered: {
                        if(!option_visible){option_visible=true}
                        else if (option_visible){option_visible=false}
                        offlinedata=false
                        about_visible=false
                    }
                },
                Action {
                    id:damn
                    tooltip: "Downloaded Wallpaper"
                    iconSource: Qt.resolvedUrl("./icons/more_vert.svg")
                    onTriggered: {
                        if(!offlinedata){offlinedata=true; _ListView.model=folderModel}
                        else if (offlinedata){offlinedata=false}
                        option_visible=false
                        about_visible=false
                    }
                }
            ]
        }
    }

    Component {
        id: page4

        Page {
            id: layoutPage
            title: qsTr("Layouting")

            property int model: 3

            Component {
                id: layout_landscape

                RowLayout {
                    anchors.margins: 20

                    Repeater {
                        model: layoutPage.model
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#5d5b59"

                            Label {
                                anchors.centerIn: parent
                                text: "I'm a box!"
                                color: "white"
                            }
                        }
                    }
                }
            }

            Component {
                id: layout_portrait

                ColumnLayout {
                    anchors.margins: 20

                    Repeater {
                        model: layoutPage.model

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#5d5b59"

                            Label {
                                anchors.centerIn: parent
                                text: "I'm a box!"
                                color: "white"
                            }
                        }
                    }
                }
            }

            ConditionalLayout {
                anchors.fill: parent
                when: app.width > 600 ? 1 : 0

                layouts: [layout_portrait, layout_landscape]
            }
        }
    }

}
