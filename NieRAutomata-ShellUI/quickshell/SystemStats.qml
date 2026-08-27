pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire
import Quickshell.Services.Notifications

Singleton {
    id: systemStats

    readonly property int volumePercent: Math.round((Pipewire.defaultAudioSink?.audio?.volume ?? 0) * 100)
    readonly property string currentTime: Qt.formatDateTime(clock.date, "hh:mm")
    readonly property string date: Qt.formatDate(clock.date, "dd MMM (dd.MM.yy)")

    property int cpuUsage: 0
    property real lastCpuTotal: 0
    property real lastCpuIdle: 0

    property int ramUsage: 0

    property int diskAvailability: 0
    property int diskFreeSpace: 0

    property alias server: notificationServer

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    NotificationServer {
        id: notificationServer
        imageSupported: true
        actionsSupported: true
        inlineReplySupported: true
        
        onNotification: notification => {
            notification.tracked = true
        }
    }

    Process {
        id: cpuTracker
        command: ["sh", "-c", "head -1 /proc/stat"]  // Get cpu stats

        stdout: SplitParser {
            onRead: data => {
                var stats = data.trim().split(/\s+/);  // Separates all cpu values

                var currentIdle = parseFloat(stats[4]) + parseFloat(stats[5]); // Calculates idle ticks since boot: idle + iowait
                var currentTotal = stats.slice(1, 9).reduce((sum, val) => sum + parseFloat(val), 0); // Calculates total active ticks: sum of all stats

                var deltaIdle = currentIdle - systemStats.lastCpuIdle;  // Gets number of idle ticks since last measurement
                var deltaTotal = currentTotal - systemStats.lastCpuTotal;  // Gets number of total ticks since last measurement

                // Calculates the cpu usage:
                // total ticks in 1.5 seconds - idle ticks in 1.5 seconds = active ticks in 1.5 seconds
                // active ticks in 1.5 seconds / total ticks in 1.5 seconds = percentage of active ticks over total ticks
                systemStats.cpuUsage = (deltaTotal - deltaIdle) / deltaTotal * 100;

                systemStats.lastCpuIdle = currentIdle;
                systemStats.lastCpuTotal = currentTotal;
            }
        }
    }
    Process {
        id: memTracker
        command: ["sh", "-c", "awk '/MemTotal/ {t=$2} /MemAvailable/ {a=$2} END {print t, a}' /proc/meminfo"]

        stdout: SplitParser {
            onRead: data => {
                var stats = data.trim().split(/\s+/);

                var total = parseFloat(stats[0]);
                var available = parseFloat(stats[1]);

                systemStats.ramUsage = (total - available) / total * 100;
            }
        }
    }
    Process {
        id: diskTracker
        command: ["sh", "-c", "df / | awk 'NR==2 {print $2, $4}'"]

        stdout: SplitParser {
            onRead: data => {
                var stats = data.trim().split(/\s+/);

                var total = parseFloat(stats[0]);
                var available = parseFloat(stats[1]);

                systemStats.diskAvailability = available / total * 100;
                systemStats.diskFreeSpace = available * 1024 / 1000000000;
            }
        }
    }

    Timer {
        interval: 1500
        running: true
        repeat: true
        onTriggered: {
            cpuTracker.running = true;
            memTracker.running = true;
            diskTracker.running = true;
        }
    }
}
