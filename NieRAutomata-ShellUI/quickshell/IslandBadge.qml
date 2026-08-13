import QtQuick
import QtQuick.Layouts

Rectangle {
    id: badge
    
    property string text: ""
    signal badgeClicked(var mouse)

    Layout.preferredWidth: 24
    Layout.preferredHeight: 24

    color: mouseArea.containsMouse ? root.accent : root.main
    radius: root.islandsRadius

    Text {
        anchors.centerIn: parent
        text: badge.text
        font.pixelSize: root.fontSize + 2
    }

    MouseArea {
        id: mouseArea
        
        anchors.fill: parent
        
        cursorShape: Qt.PointingHandCursor
        onClicked: (mouse) => badge.badgeClicked(mouse)
    }
}