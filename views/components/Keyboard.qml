import QtQuick 2.0

Rectangle {
    color: panelColor
    width: parent.width
    height: column.height + 2*small
    anchors.bottom: parent.bottom

    Column {
        id: column
        spacing: small
        anchors.centerIn: parent
        x: small
        width: parent.width - 2*x
        Repeater {
            model: 5

            Row {
                property int count: 8
                spacing: (width - count*small) / (count-1)
                width: parent.width
                Repeater {
                    model: parent.count
                    Rectangle { radius: 2; width: small ; height: small }
                }
            }
        }
    }
}
