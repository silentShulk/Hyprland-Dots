import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import Quickshell.Services.Pipewire
import Quickshell.Hyprland
import Quickshell.Io


PanelWindow {
    id: root

    function iconForAppId(appId) {
        const entry = DesktopEntries.byId(appId) // ?? DesktopEntries.heuristicLookup(appId)
        return entry.icon
    }

    // Colors
    property color main: '#d6cab2'
    property color accent: '#706857'
    property color accentDark: '#504635'
    property color accentSecondary: '#c76248'
    property color accentTertiary: '#6eb2a3'
    property color accentSecondaryDark: '#b65135'
    property color accentTertiaryDark: '#5da192'

    // Bar properties
    anchors {
        top: true
        left: true
        right: true
    }
    height: 32
    color: root.accentDark
    
    // Data
    readonly property int volumePercent: Math.round((Pipewire.defaultAudioSink?.audio?.volume ?? 0) * 100)
    readonly property string currentTime: Qt.formatDateTime(clock.date, "hh:mm")

    property int cpuUsage: 0
    property real lastCpuTotal: 0
    property real lastCpuIdle: 0

    property int ramUsage: 0

    property int diskAvailability: 0
    property int diskFreeSpace: 0
    
    // Left
    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 16
        spacing: 16
        
        Repeater {
            model: Hyprland.workspaces
            
            RowLayout {
                spacing: 4
                
                Repeater {
                    model: modelData.toplevels
                    
                    IconImage {
                        implicitSize: 16
                        source: 
                        Quickshell.iconPath(
                            DesktopEntries.byId(
                                modelData.wayland?.appId
                            ).icon
                        )
                    }
                }
            }
        }
    }

    // Center
    RowLayout {
        anchors.centerIn: parent

        Text {
            text: root.currentTime
            color: root.main
        }
    }

    // Right
    RowLayout {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 16

        Text {
            text: `${root.volumePercent}%`
            color: root.main
        } PwObjectTracker { objects: [Pipewire.defaultAudioSink] }

        Text {
            text: `${root.cpuUsage}%`
            color: root.main
        }
        Text {
            text: `${root.ramUsage}%`
            color: root.main
        }
        Text {
            text: `${root.diskAvailability}% (${root.diskFreeSpace})`
            color: root.main
        }
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
    
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}