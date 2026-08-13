import Quickshell
import QtQuick



Rectangle {
    id: notification
    
    width: notificationButton.height
    height: notificationButton.height

    color: root.accentDark
    radius: root.islandsRadius
    
    Text {
        id: notificationButton

        anchors.centerIn: parent
        
        text: "\uf0f3"
        font.pixelSize: root.fontSize*2
        
        color: root.main
    }

    MouseArea {
        anchors.fill: parent
        
        cursorShape: Qt.PointingHandCursor
        onClicked: { Quickshell.execDetached(["swaync-client", "-t"]) }
    }
}