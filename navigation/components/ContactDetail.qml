import QtQuick 2.0

Rectangle {
    property int lineCount: 1

    radius: tiny
    height: column.height + 2*extraSmall
    color: Qt.rgba(primaryColor.r, primaryColor.g, primaryColor.b, 0.5)
    Column {
        id: column
        spacing: extraSmall
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        Repeater {
            model: lineCount
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 2*small
            }
        }
    }
}
