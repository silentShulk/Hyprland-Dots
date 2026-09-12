import QtQuick

Rectangle {
    id: badge

    required property string icon
    property bool background: true
    property color iconColor: "black"
    property real fontSizeMultiplier: 1
    signal badgeClicked(var mouse)

    width: 24
    height: 24

    color: background ? (mouseArea.containsMouse ? Theme.fgDark : Theme.fg) : "transparent"
    radius: topBar.islandsRadius

    Text {
        anchors.centerIn: parent
        
        text: badge.icon
        color: badge.iconColor
        
        font.family: Theme.iconFontFamily
        font.variableAxes: Theme.iconAxes
        font.pixelSize: Theme.iconFontSize * badge.fontSizeMultiplier
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: mouse => badge.badgeClicked(mouse)
    }
}