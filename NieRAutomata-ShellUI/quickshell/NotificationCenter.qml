import Quickshell
import QtQuick

Rectangle {
    id: notification

    width: topBar.islandsHeight + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.bg
    radius: topBar.islandsRadius

    Text {
        anchors.centerIn: parent

        text: "\uf0f3"
        font.family: Theme.fontFamily
        font.weight: Theme.fontWeight
        font.pixelSize: Theme.fontSize * 2

        color: Theme.fg
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Quickshell.execDetached(["swaync-client", "-t"]);
        }
    }
}