import QtQuick

Rectangle {
    id: badge

    required property string icon
    property bool background: true
    property color iconColor: "black"
    property real fontSizeMultiplier: 1
    property int widthOverride: 24
    property int heightOverride: 24
    
    signal badgeClicked(var mouse)

    implicitWidth: widthOverride
    implicitHeight: heightOverride

    color: background ? (mouseArea.containsMouse ? Theme.fgDark : Theme.fg) : "transparent"
    radius: Theme.radius /2

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