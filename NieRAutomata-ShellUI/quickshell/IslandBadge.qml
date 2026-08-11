import QtQuick
import QtQuick.Layouts

Rectangle {
    id: badgeRoot
    
    // Define the custom parameter property
    property string text: ""

    Layout.preferredWidth: 24
    Layout.preferredHeight: 24

    color: root.main
    radius: root.islandsRadius

    Text {
        anchors.centerIn: parent
        text: badgeRoot.text
    }
}