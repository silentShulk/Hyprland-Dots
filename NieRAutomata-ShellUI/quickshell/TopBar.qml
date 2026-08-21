import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: topBar

    // Bar properties
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Theme.barHeight
    color: 'transparent'

    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: Theme.islandsMargin
        anchors.topMargin: Theme.islandsMargin

        spacing: Theme.islandsSpacing

        HyprlandWorkspaces {}
    }

    // Center
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.islandsMargin

        spacing: Theme.islandsSpacing

        Clock {}

        NotificationCenter {}
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: Theme.islandsMargin
        anchors.topMargin: Theme.islandsMargin

        spacing: Theme.islandsSpacing

        Audio {}

        SystemMonitor {}

        PowerButton {}
    }

    
    Calendar {
        id: calendarPopup
    }
}
