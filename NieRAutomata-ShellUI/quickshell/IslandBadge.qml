import QtQuick
import QtQuick.Layouts

Rectangle {
    id: badge
    
    property string text: ""
    signal badgeClicked(var mouse)

    width: 24
    height: 24

    color: mouseArea.containsMouse ? root.accent : root.main
    radius: root.islandsRadius

    Text {
        anchors.centerIn: parent
        text: badge.text
        font.family: root.fontFamily
        font.weight: root.fontWeight
        font.pixelSize: root.fontSize + 2
    }

    MouseArea {
        id: mouseArea
        
        anchors.fill: parent
        
        cursorShape: Qt.PointingHandCursor
        onClicked: (mouse) => badge.badgeClicked(mouse)
    }
}