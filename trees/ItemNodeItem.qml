import QtQuick 2.0
import "components"

NodeItem {
    id: root
    property string text
    property color color: "transparent"
    Rectangle {
        id: box
        color: panelColor
        height: colorIndicator.height + 2*unit
        width: node.width
        radius: 3
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            id: colorIndicator
            x: unit
            width: visible ? height : 0
            height: label.height + unit
            color: root.color
            border {
                width: Math.ceil(unit/10)
                color: colorIndicator.color === box.color ? Qt.rgba(primaryColor.r, primaryColor.g, primaryColor.b, 0.5) : "transparent"
            }
            visible: color != transparentColor
            anchors.verticalCenter: parent.verticalCenter
            property color transparentColor: "transparent"
        }

        Text {
            id: label
            text: root.text
            color: primaryColor
            anchors {
                verticalCenter: parent.verticalCenter
                left: colorIndicator.right
                right: parent.right
                margins: unit
            }

            font.pixelSize: unit*2.8
            elide: Text.ElideRight
        }
    }
}