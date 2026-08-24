import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

PanelWindow {
    id: cava

    anchors {
        left: true
        right: true
        bottom: true
    }

    implicitHeight: 512
    color: "transparent"

    exclusiveZone: 0
    WlrLayershell.layer: WlrLayer.Background

    property int barCount: 64
    property int barSpacing: 8
    property color barColor: Theme.fg
    property real smoothMs: 32

    property var barValues: []

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        
        height: parent.height
        
        spacing: cava.barSpacing

        Repeater {
            model: cava.barCount
            
            delegate: Rectangle {
                required property int index
                
                anchors.bottom: parent.bottom
                
                width: (cava.width - (cava.barCount - 1) * cava.barSpacing) / cava.barCount
                height: Math.max(2, ((cava.barValues[index] || 0) / 100) * cava.height)
                
                color: cava.barColor
                topLeftRadius: width / 2
                topRightRadius: width / 2

                Behavior on height {
                    NumberAnimation { duration: cava.smoothMs; easing.type: Easing.OutQuad }
                }
            }
        }
    }
    
    Process {
        id: writeConfig
        running: true
        command: ["sh", "-c",
            "mkdir -p \"$HOME/.cache/quickshell\" && cat > \"$HOME/.cache/quickshell/cava_qs.conf\" <<EOF\n" +
            "autosens = 1\n"+
            "[general]\n" +
            "bars = " + cava.barCount + "\n" +
            "framerate = 30\n\n" +
            "[input]\n" +
            "method = pulse\n" +
            "source = auto\n\n" +
            "[output]\n" +
            "method = raw\n" +
            "raw_target = /dev/stdout\n" +
            "data_format = ascii\n" +
            "ascii_max_range = 100\n" +
            "bar_delimiter = 59\n" +   // ';'
            "frame_delimiter = 10\n" + // '\\n'
            "\n[smoothing]\n" +
            "noise_reduction = 60\n" +
            "EOF"
        ]
    }

    Process {
        id: cavaProcess
        command: ["sh", "-c", "cava -p \"$HOME/.cache/quickshell/cava_qs.conf\""]
        running: true

        stdout: SplitParser {
            splitMarker: "\n"
            onRead: line => {
                if (!line || line.length === 0) return
                const vals = line.split(";")
                    .filter(s => s.length > 0)
                    .map(s => parseInt(s, 10))
                if (vals.length === cava.barCount) {
                    cava.barValues = vals
                }
            }
        }
    }
}
