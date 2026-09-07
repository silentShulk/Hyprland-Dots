import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Notifications

Rectangle {
    id: notificationPopUp

    required property Notification receivedNotification;

    NumberAnimation on x {
        from: -notificationPopUp.implicitWidth
        to: 0
        duration: 250
    }
    
    implicitWidth: 318
    implicitHeight: 128
        
    color: Theme.bg
    radius: Theme.radius

    ColumnLayout {
        id: notificationContent
        
        anchors.fill: parent
        anchors.margins: 12
        
        spacing: 12
        
        RowLayout {
            spacing: 12
            
            IconImage {
                source: notificationPopUp.receivedNotification.image != "" ? Quickshell.iconPath(notificationPopUp.receivedNotification.image) : Quickshell.iconPath(notificationPopUp.receivedNotification.appIcon)
                Layout.preferredWidth: 45
                Layout.preferredHeight: 45
            }

            Text {
                text: notificationPopUp.receivedNotification.summary
                
                Layout.fillWidth: true
                
                font.bold: true
                font.pixelSize: Theme.fontSize
                wrapMode: Text.Wrap
                maximumLineCount: 2
                elide: Text.ElideRight
                
                color: Theme.fg
            }
        }

        Text {
            text: notificationPopUp.receivedNotification.body
            
            Layout.fillWidth: true
            
            wrapMode: Text.Wrap
            maximumLineCount: 3
            elide: Text.ElideRight
            
            color: Theme.fg
        }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.right: parent.right

        anchors.margins: 8
        
        implicitWidth: 24
        implicitHeight: 24

        color: Theme.accent1
        radius: implicitWidth /2

        Text {
            anchors.centerIn: parent
            text: "\u{2715}"
            font.pixelSize: Theme.fontSize
        }

        MouseArea {
            anchors.fill: parent

            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: notificationPopUp.receivedNotification.dismiss()
        }
    }

    Timer {
        interval: {
            if (notificationPopUp.receivedNotification.expireTimeout > 0) return notificationPopUp.receivedNotification.expireTimeout
            if (notificationPopUp.receivedNotification.expireTimeout === -1) return 3000
            return 0
        }
        running: interval > 0
        repeat: false
        onTriggered: notificationPopUp.receivedNotification.expire()
    }
}