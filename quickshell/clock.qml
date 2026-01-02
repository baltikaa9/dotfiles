import QtQuick
import Quickshell

ShellRoot {
    PanelWindow {
        anchors.top: true
        anchors.horizontalCenter: true
        
        // Контейнер для текста
        Text {
            id: clockText
            color: "white"
            font.pixelSize: 24
            font.bold: true
            padding: 10

            // Функция для получения текущего времени
            function updateTime() {
                clockText.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
            }

            // Таймер, который обновляет текст каждую секунду
            Timer {
                interval: 1000
                running: true
                repeat: true
                triggeredOnStart: true // Чтобы время появилось сразу при запуске
                onTriggered: clockText.updateTime()
            }
        }
    }
}
