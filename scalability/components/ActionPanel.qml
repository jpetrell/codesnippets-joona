import QtQuick 2.2

Panel {
    color: contentColor
    height: medium + small
    Row {
        spacing: small
        x: pageMargin
        anchors.verticalCenter: parent.verticalCenter
        Repeater {
            model: 4
            Rectangle {
                color: pageColor
                width: small
                height: small
            }
        }
    }
}
