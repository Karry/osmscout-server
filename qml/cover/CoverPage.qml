import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    Image {
        id: icon
        source: "/usr/share/icons/hicolor/256x256/apps/harbour-osmscout-server.png"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        width: parent.width/2
    }

    Label {
        id: label
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: Theme.paddingLarge
        text: qsTr("OSM Scout Server")

        function setText(q) {
            if (q > 0) text = qsTr("Jobs") + ": " + q
            else text = qsTr("Idle")
        }

        Connections {
            target: infohub;
            onQueueChanged: {
                label.setText(queue)
            }
        }

        Component.onCompleted: label.setText(infohub.queue)

    }


    //    CoverActionList {
    //        id: coverAction

    //        CoverAction {
    //            iconSource: "image://theme/icon-cover-next"
    //        }

    //        CoverAction {
    //            iconSource: "image://theme/icon-cover-pause"
    //        }
    //    }
}


