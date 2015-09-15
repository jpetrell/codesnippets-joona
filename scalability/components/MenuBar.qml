import QtQuick 2.2

Panel {
    id: panel

    height: medium + small
    Row {
        x: pageMargin
        spacing: small
        anchors.verticalCenter: parent.verticalCenter
        Repeater {
            model: [panel.width/10, panel.width/8, panel.width/9, panel.width/11]
            Label {
                width: modelData
                color: primaryColor
            }
        }
    }
}
