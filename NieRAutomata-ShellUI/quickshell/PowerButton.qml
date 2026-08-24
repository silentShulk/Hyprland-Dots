import QtQuick

Rectangle {
    id: power

    width: topBar.islandsHeight + topBar.islandsPadding * 2
    height: topBar.islandsHeight + topBar.islandsPadding * 2

    color: Theme.accent1
    radius: topBar.islandsRadius

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