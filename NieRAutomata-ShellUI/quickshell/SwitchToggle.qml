import QtQuick

Rectangle {
    id: switchToggle
    required property bool checked

    implicitWidth: 40
    implicitHeight: 15

    color: Theme.fg
    radius: Theme.radius / 2

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter

        implicitWidth: 25
        implicitHeight: 17

        x: switchToggle.checked ? parent.width - implicitWidth : 0

        color: switchToggle.checked ? Theme.accent2 : Theme.accent1
        radius: Theme.radius / 2

        Behavior on x { NumberAnimation { duration: 150 } }
    }
}