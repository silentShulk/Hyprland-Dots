import QtQuick

import "../../Theme"

Rectangle {
    id: switchToggle
    required property bool checked

    implicitWidth: 40
    implicitHeight: 15

    color: Colors.fg
    radius: Style.radius

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter

        implicitWidth: 25
        implicitHeight: switchToggle.implicitHeight +4

        x: switchToggle.checked ? parent.width - implicitWidth : 0

        color: switchToggle.checked ? Colors.accent2 : Colors.accent1
        radius: Style.radius

        Behavior on x { NumberAnimation { duration: 150 } }
    }
}