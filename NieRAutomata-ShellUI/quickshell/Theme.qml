pragma Singleton
import Quickshell
import QtQuick

Singleton {
    // Colors
    readonly property color bg: '#706857'
    readonly property color fg: '#d6cab2'
    readonly property color accent1: '#c76248'
    readonly property color accent2: '#6eb2a3'

    readonly property color bgDark: '#38342b'
    readonly property color accent1Dark: '#7a3625'
    readonly property color accent2Dark: '#395c54'
    readonly property color fgDark: '#877a61'

    // Typography
    readonly property string fontFamily: "JetBrainsMono Nerd Font Propo"
    readonly property int fontWeight: Font.Medium
    readonly property int fontSize: 14

    // Style
    readonly property int radius: 16
}
