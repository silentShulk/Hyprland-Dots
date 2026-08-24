import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: calendar

    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Ignore

    visible: false

    anchors {
        top: true
    }

    implicitWidth: 256
    implicitHeight: 384

    color: "transparent"

    property var currentDate: new Date()
    property int selectedMonth: currentDate.getMonth()
    property int selectedYear: currentDate.getFullYear()

    Rectangle {
        anchors.fill: parent

        color: Qt.rgba(Theme.bg.r, Theme.bg.g, Theme.bg.b, 0.75)
        radius: topBar.islandsRadius

        border.color: Theme.fg
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16

            spacing: 8

            RowLayout {
                Rectangle {
                    width: 24
                    height: 24

                    color: "transparent"
                    radius: topBar.islandsRadius

                    Text {
                        anchors.centerIn: parent

                        text: "‹"
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSize * 2

                        color: Theme.accent1
                    }

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (calendar.selectedMonth === 0) {
                                calendar.selectedMonth = 11;
                                calendar.selectedYear -= 1;
                            } else {
                                calendar.selectedMonth -= 1;
                            }
                        }
                    }
                }
                Text {
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter

                    text: Qt.formatDate(new Date(calendar.selectedYear, calendar.selectedMonth, 1), "MMMM yyyy")
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.fontSize
                    font.bold: true

                    color: Theme.fg
                }
                Rectangle {
                    width: 24
                    height: 24

                    color: "transparent"
                    radius: topBar.islandsRadius

                    Text {
                        anchors.centerIn: parent

                        text: "›"
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSize * 2

                        color: Theme.accent2
                    }

                    MouseArea {
                        anchors.fill: parent

                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (calendar.selectedMonth === 0) {
                                calendar.selectedMonth = 11;
                                calendar.selectedYear -= 1;
                            } else {
                                calendar.selectedMonth -= 1;
                            }
                        }
                    }
                }
            }

            DayOfWeekRow {
                Layout.fillWidth: true

                locale: Qt.locale()

                delegate: Text {
                    required property string shortName
                    text: shortName
                    font.pixelSize: Theme.fontSize - 3
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter

                    color: Theme.fg
                    opacity: 0.5
                }
            }

            MonthGrid {
                Layout.fillWidth: true
                Layout.fillHeight: true

                month: calendar.selectedMonth
                year: calendar.selectedYear
                locale: Qt.locale()

                delegate: Rectangle {
                    required property var model

                    opacity: model.month === calendar.selectedMonth ? 1.0 : 0.25
                    color: model.today ? Theme.accent2 : "transparent"
                    radius: topBar.islandsRadius

                    Text {
                        anchors.centerIn: parent

                        text: parent.model.day
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSize - 1
                        font.bold: parent.model.today

                        color: model.today ? Theme.accent1 : Theme.fg
                    }
                }
            }
        }
    }
}