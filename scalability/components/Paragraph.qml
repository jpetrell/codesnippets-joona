import QtQuick 2.2

Column {
    property int lineCount
    property real lineHeight: extraSmall
    spacing: small

    Repeater {
        model: lineCount
        Label {
            width: parent.width
            height: lineHeight
        }
    }
}
