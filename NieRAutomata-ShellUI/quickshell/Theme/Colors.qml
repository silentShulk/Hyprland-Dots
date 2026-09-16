pragma Singleton
import Quickshell
import QtQuick

Singleton {
    readonly property color bg: '#706857'
    readonly property color fg: '#d6cab2'
    readonly property color accent1: '#c76248'
    readonly property color accent2: '#6eb2a3'

    readonly property color bgDark: '#38342b'
    readonly property color fgDark: '#877a61'
    readonly property color accent1Dark: '#7a3625'
    readonly property color accent2Dark: '#395c54'

    function darkVariant(c) {
        if (Qt.colorEqual(c, bg)) return bgDark
        if (Qt.colorEqual(c, fg)) return fgDark
        if (Qt.colorEqual(c, accent1)) return accent1Dark
        if (Qt.colorEqual(c, accent2)) return accent2Dark
        return Qt.darker(c, 1.3)
    }
}
