import Quickshell
import QtQuick

Rectangle {
    id: notification

    width: root.islandsHeight + root.islandsPadding * 2
    height: root.islandsHeight + root.islandsPadding * 2

    color: root.bg
    radius: root.islandsRadius

    Text {
        anchors.centerIn: parent

        text: "\uf0f3"
        font.family: root.fontFamily
        font.weight: root.fontWeight
        font.pixelSize: root.fontSize * 2

        color: root.fg
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Quickshell.execDetached(["swaync-client", "-t"]);
        }
    }
}
