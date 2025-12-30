import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

ShellRoot {
    PanelWindow {
        anchors { top: true; left: true; right: true }
        height: 45
        color: "transparent" // Весь Waybar у вас прозрачный

        // Общий контейнер (аналог box в Waybar)
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            spacing: 0

            // --- ЛЕВАЯ ЧАСТЬ ---
            Row {
                Layout.alignment: Qt.AlignLeft
                spacing: 0

                // Модуль воркспейсов
                WBox {
                    Row {
                        spacing: 10
                        Repeater {
                            model: 5 // Упрощенно: 5 воркспейсов
                            Text {
                                text: index + 1 === Hyprland.activeWorkspace.id ? "●" : "󰧞"
                                color: "#CDD6F4"
                                font.pixelSize: 18
                            }
                        }
                    }
                }

                // Кнопка меню
                WBox { 
                    Text { text: "☰"; color: "#CDD6F4"; font.pixelSize: 18 }
                    MouseArea { anchors.fill: parent; onClicked: Quickshell.exec(["wofi", "--show", "drun"]) }
                }

                // CPU (с кастомным цветом из CSS)
                WBox { 
                    Text { text: "󰍛 24%"; color: "#CDD6F4" } // Логику CPU нужно подключать отдельно
                }
            }

            // --- ЦЕНТРАЛЬНАЯ ЧАСТЬ ---
            WBox {
                Layout.alignment: Qt.AlignCenter
                Text {
                    id: clockText
                    text: Qt.formatDateTime(new Date(), "HH:mm:ss")
                    color: "#CDD6F4"
                    font.pixelSize: 16
                    Timer {
                        interval: 1000; running: true; repeat: true
                        onTriggered: clockText.text = Qt.formatDateTime(new Date(), "HH:mm:ss")
                    }
                }
            }

            // --- ПРАВАЯ ЧАСТЬ ---
            Row {
                Layout.alignment: Qt.AlignRight
                spacing: 0

                WBox {
                    Text { text: Hyprland.activeLayout === "English" ? "󰰎 us" : "󰰍 ru"; color: "#CDD6F4" }
                }

                WBox {
                    Text { text: " 80%"; color: "#CDD6F4" }
                }
            }
        }
    }
}
