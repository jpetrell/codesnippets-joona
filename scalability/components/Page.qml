import QtQuick 2.2

Column {
    property alias title: label.text
    default property alias children: content.children
    property alias contentHeight: content.height

    spacing: small
    width: 8*medium

    Rectangle {
        id: content
        color: pageColor
        width: parent.width
        height: 12*medium
        clip: true
    }
    Text {
        id: label
        width: parent.width
        color: titleColor
        text: modelData
        font.pixelSize: fontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}

