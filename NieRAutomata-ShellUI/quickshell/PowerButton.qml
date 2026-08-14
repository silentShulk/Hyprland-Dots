import QtQuick

// Power Button
Rectangle {
    id: power

    width: root.islandsHeight + root.islandsPadding * 2
    height: root.islandsHeight + root.islandsPadding * 2

    color: root.accent1
    radius: root.islandsRadius

    Text {
        anchors.centerIn: parent

        text: "⏻"
        font.family: root.fontFamily
        font.weight: root.fontWeight
        font.pixelSize: root.fontSize * 2

        color: root.fg
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            logoutMenu.visible = !logoutMenu.visible;
        }
    }
}
