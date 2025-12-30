import QtQuick

Rectangle {
    id: root
    
    // Свойства для внешнего управления
    property alias content: innerContent.data
    
    // Авто-размер по контенту
    implicitWidth: innerContent.width + 20
    implicitHeight: 32
    
    // Цвет в формате HEX (так надежнее для Qt 6.10)
    // #B3 = ~70% прозрачности, 1A1D23 = ваш темно-серый
    color: "#B31A1D23"
    radius: 15

    Row {
        id: innerContent
        anchors.centerIn: parent
        spacing: 8
    }
}
