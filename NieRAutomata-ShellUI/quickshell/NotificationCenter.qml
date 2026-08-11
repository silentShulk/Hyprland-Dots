import QtQuick
import QtQuick.Layouts



// Notification Center
Rectangle {
    Layout.preferredWidth: notification.height
    Layout.preferredHeight: notification.height

    color: root.accentDark
    radius: root.islandsRadius
    
    Text {
        id: notification

        anchors.centerIn: parent
        
        text: "\uf0f3"
        font.pixelSize: root.fontSize*2
        color: root.main
    }
}