import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("WebPhonon-Android")
    color: "black"
    FileDialog{
        id:fileDialog
        onAccepted:{
            mediaplayer.source=fileDialog.fileUrl
            mediaplayer.play();
        }

    }
    Action{
        id: fileOpen
        onTriggered: fileDialog.open();

    }
    Action{
        id: applicationExit
        onTriggered: Qt.quit();
    }
    Action{
        id: mediaPlay
        onTriggered: mediaplayer.play();
    }
    Action{
        id: mediaPause
        onTriggered: mediaplayer.pause();

    }
    Action{
        id:skipFoward
        onTriggered: mediaplayer.seek(mediaplayer.position+10000);
    }
    Action{
        id: skipBackward
        onTriggered: mediaplayer.seek(mediaplayer.position-10000);
    }
    Action{
        id: mediaStop
        onTriggered: mediaplayer.stop();

    }

    /*menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                action: fileOpen
            }
            MenuItem {
                text: qsTr("Exit")
                action: applicationExit
            }
        }
    }*/
    toolBar: ToolBar{
        style: ToolBarStyle
        {
            background:Rectangle{
                color: "black"
            }

        }

        RowLayout {
            anchors.fill: parent

            ToolButton {
                iconSource: "qrc:////document-open.png"
                action: fileOpen

            }
            ToolButton{
                    iconSource: "qrc:////media-skip-backward.png"
                    action: skipBackward
            }
            ToolButton{
                iconSource: "qrc:////media-playback-start.png"
                action: mediaPlay

            }
            ToolButton{
                iconSource: "qrc:////media-playback-pause.png"
                action: mediaPause

            }
            ToolButton{
                iconSource: "qrc:////media-playback-stop.png"
                action: mediaStop

            }
            ToolButton{
                iconSource: "qrc:////media-skip-forward.png"
                action: skipFoward

            }

            ToolButton {
                iconSource: "qrc:////application-exit.png"
                action: applicationExit
            }

        }
    }

    Item{
        anchors.fill: parent

        MediaPlayer {
            id: mediaplayer
            source: fileDialog.fileUrl
        }

        VideoOutput {
            id:vid
            anchors.fill: parent
            source: mediaplayer
        }


        MouseArea {
            id: playArea
            anchors.fill: parent
            onClicked: mediaplayer.playbackState === MediaPlayer.PlayingState ? mediaplayer.pause() : mediaplayer.play()



        }
    }
}
