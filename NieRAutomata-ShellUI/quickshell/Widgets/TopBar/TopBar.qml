import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Data"
import "../Components"
import "../../Theme"

PanelWindow {
    id: topBar

    // Bar properties
    anchors {
        top: true
        left: true
        right: true
    }

    readonly property int barHeight: 56

    implicitHeight: barHeight
    color: 'transparent'

    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: Style.margin
        anchors.topMargin: Style.margin
        anchors.bottomMargin: Style.margin

        spacing: Style.margin

        HyprlandWorkspaces {}
    }

    // Center
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Style.margin
        anchors.bottomMargin: Style.margin
        
        spacing: Style.margin

        Clock {}

        NotificationCenterButton {}
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: Style.margin
        anchors.topMargin: Style.margin
        anchors.bottomMargin: Style.margin

        spacing: Style.margin

        Audio {}

        SystemMonitor {}

        PowerButton {}
    }
    
    Calendar {
        id: calendarPopup
        visible: false
    }
}
