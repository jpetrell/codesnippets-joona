import QtQuick 2.2

Rectangle {
    property int lineCount
    radius: small
    color: primaryColor
    height: column.height + 2*small

    Column {
        id: column
        x: small
        spacing: small
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width - 2*x

        Repeater {
            model: lineCount

            Label { color: contentColor }
        }
    }
}
