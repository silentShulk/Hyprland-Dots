import Quickshell
import QtQuick
import QtQuick.Layouts



// Power Button
Rectangle {
    Layout.preferredWidth: power.height
    Layout.preferredHeight: power.height

    color: root.accentSecondary
    radius: root.islandsRadius
    
    Text {
        id: power

        anchors.centerIn: parent
        
        text: "⏻"
        font.pixelSize: root.fontSize*2
        color: root.main
    }
}