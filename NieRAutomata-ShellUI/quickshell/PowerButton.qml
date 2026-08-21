import QtQuick

Rectangle {
    id: power

    width: Theme.islandsHeight + Theme.islandsPadding * 2
    height: Theme.islandsHeight + Theme.islandsPadding * 2

    color: Theme.accent1
    radius: Theme.islandsRadius

    Text {
        anchors.centerIn: parent

        text: "⏻"
        font.family: Theme.fontFamily
        font.weight: Theme.fontWeight
        font.pixelSize: Theme.fontSize * 2

        color: Theme.fg
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            logoutMenu.visible = !logoutMenu.visible;
        }
    }
}
