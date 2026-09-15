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

    readonly property int barHeight: 54

    readonly property int islandsWidth: 256
    readonly property int islandsHeight: 24
    readonly property int islandsPadding: 8
    readonly property int islandsMargin: 12
    readonly property int islandsRadius: 8
    readonly property int islandsSpacing: 16

    implicitHeight: barHeight
    color: 'transparent'

    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: topBar.islandsMargin
        anchors.topMargin: topBar.islandsMargin

        spacing: topBar.islandsSpacing

        HyprlandWorkspaces {}
    }

    // Center
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: topBar.islandsMargin

        spacing: topBar.islandsSpacing

        Clock {}

        NotificationCenterButton {}
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: topBar.islandsMargin
        anchors.topMargin: topBar.islandsMargin

        spacing: topBar.islandsSpacing

        Audio {}

        SystemMonitor {}

        PowerButton {}
    }

    
    Calendar {
        id: calendarPopup
        visible: false
    }
}
