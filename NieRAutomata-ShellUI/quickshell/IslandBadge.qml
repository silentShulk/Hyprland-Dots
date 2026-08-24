import QtQuick
import QtQuick.Layouts

Rectangle {
    id: badge

    property string text: ""
    signal badgeClicked(var mouse)

    width: 24
    height: 24

    color: mouseArea.containsMouse ? Theme.fgDark : Theme.fg
    radius: topBar.islandsRadius

    Text {
        anchors.centerIn: parent
        text: badge.text
        font.family: Theme.fontFamily
        font.weight: Theme.fontWeight
        font.pixelSize: Theme.fontSize + 2
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: mouse => badge.badgeClicked(mouse)
    }
}