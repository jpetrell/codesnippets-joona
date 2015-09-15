import QtQuick 2.2

Rectangle {
    property alias text: label.text

    width: large
    height: large
    color: contentColor
    Text {
        id: label
        text: model.index + 1
        color: primaryColor
        anchors.centerIn: parent
        font.pixelSize: fontSize
    }
}
