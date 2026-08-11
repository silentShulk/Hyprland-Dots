import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Services.Pipewire



PanelWindow {
    id: root

    // Colors
    readonly property color main: '#d6cab2'
    readonly property color accent: '#706857'
    readonly property color accentDark: '#504635'
    readonly property color accent2: "#736f61"
    readonly property color accentSecondary: '#c76248'
    readonly property color accentTertiary: '#6eb2a3'
    readonly property color accentSecondaryDark: '#b65135'
    readonly property color accentTertiaryDark: '#5da192'

    // Bar properties
    anchors {
        top: true
        left: true
        right: true
    }
    
    height: 54
    color: '#00000000'

    readonly property int islandsWidth: 256
    readonly property int islandsPadding: 8
    readonly property int islandsMargin: 12
    readonly property int islandsRadius: 4
    
    readonly property int fontSize: 14
    
    // Data
    readonly property int volumePercent: Math.round((Pipewire.defaultAudioSink?.audio?.volume ?? 0) * 100)
    readonly property string currentTime: Qt.formatDateTime(clock.date, "hh:mm")
    readonly property string date: Qt.formatDate(clock.date, "dd.MM.yyyy")

    property int cpuUsage: 0
    property real lastCpuTotal: 0
    property real lastCpuIdle: 0

    property int ramUsage: 0

    property int diskAvailability: 0
    property int diskFreeSpace: 0

    PwObjectTracker { objects: [Pipewire.defaultAudioSink] }


    
    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: root.islandsMargin
        anchors.topMargin: root.islandsMargin

        spacing: 16

        HyprlandWorkspaces {}
    }

    

    // Center
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: root.islandsMargin

        spacing: 16

        Clock {}
    
        NotificationCenter {}
    }


    
    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: root.islandsMargin
        anchors.topMargin: root.islandsMargin
        
        spacing: 16

        // System Monitor
        SystemMonitor {}
    
        PowerButton {}
    }

    
    
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Process {
        id: cpuTracker
        command: ["sh", "-c", "head -1 /proc/stat"]  // Get cpu stats

        stdout: SplitParser {
            onRead: data => {
                var stats = data.trim().split(/\s+/)  // Separates all cpu values

                var currentIdle = parseFloat(stats[4]) + parseFloat(stats[5]) // Calculates idle ticks since boot: idle + iowait
                var currentTotal = stats.slice(1, 9).reduce((sum, val) => sum + parseFloat(val), 0) // Calculates total active ticks: sum of all stats

                var deltaIdle = currentIdle - root.lastCpuIdle  // Gets number of idle ticks since last measurement
                var deltaTotal = currentTotal - root.lastCpuTotal  // Gets number of total ticks since last measurement

                // Calculates the cpu usage:
                // total ticks in 1.5 seconds - idle ticks in 1.5 seconds = active ticks in 1.5 seconds
                // active ticks in 1.5 seconds / total ticks in 1.5 seconds = percentage of active ticks over total ticks
                root.cpuUsage = (deltaTotal-deltaIdle)/deltaTotal * 100 

                root.lastCpuIdle = currentIdle
                root.lastCpuTotal = currentTotal
            }
        }
    }
    Process {
        id: memTracker
        command: ["sh", "-c", "awk '/MemTotal/ {t=$2} /MemAvailable/ {a=$2} END {print t, a}' /proc/meminfo"]
    
        stdout: SplitParser {
            onRead: data => {
                var stats = data.trim().split(/\s+/)
    
                var total = parseFloat(stats[0])
                var available = parseFloat(stats[1])
    
                root.ramUsage = (total - available) / total * 100
            }
        }
    }
    Process {
        id: diskTracker
        command: ["sh", "-c", "df / | awk 'NR==2 {print $2, $4}'"]

        stdout: SplitParser {
            onRead: data => {
                var stats = data.trim().split(/\s+/)

                var total = parseFloat(stats[0])
                var available = parseFloat(stats[1])

                root.diskAvailability = available / total * 100
                root.diskFreeSpace = available * 1024 / 1000000000
            }
        }
    }
    
    Timer {
        interval: 1500
        running: true
        repeat: true
        onTriggered: {
            cpuTracker.running = true
            memTracker.running = true
            diskTracker.running = true
        }
    }
}