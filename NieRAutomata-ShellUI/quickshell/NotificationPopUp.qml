import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets

Rectangle {
    id: notificationPopUp

    required property string notifId
    required property string summary
    required property string body
    required property string appIcon
    required property string image
    signal dismissed()

    NumberAnimation on x {
        from: -notificationPopUp.implicitWidth
        to: 0
        duration: 250
    }
    
    implicitWidth: 350
    implicitHeight: 150
        
    radius: Theme.radius
    color: Theme.bg
    border.width: 5
    border.color: Theme.fgDark

    ColumnLayout {
        id: notificationContent
        
        anchors.fill: parent
        anchors.margins: 12
        
        spacing: 12
        
        RowLayout {
            spacing: 12
            
            IconImage {
                source: notificationPopUp.image != "" ? Quickshell.iconPath(notificationPopUp.image) : Quickshell.iconPath(notificationPopUp.appIcon)
                Layout.preferredWidth: 45
                Layout.preferredHeight: 45
            }

            Text {
                text: notificationPopUp.summary
                
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
            text: notificationPopUp.body
            
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
            onClicked: notificationPopUp.dismissed()
        }
    }
}