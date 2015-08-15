import QtQuick 2.0

Item {
    property QtObject node
    property alias layout: layoutItem
    width: row.width
    height: row.height

    Row {
        id: row
        spacing: node.spacing

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
                color: node.color
                border {
                    width: 1
                    color: colorIndicator.color === box.color ? Qt.rgba(primaryColor.r, primaryColor.g, primaryColor.b, 0.5) : "transparent"
                }
                visible: color != transparentColor
                anchors.verticalCenter: parent.verticalCenter
                property color transparentColor: "transparent"
            }

            Text {
                id: label
                text: node.text
                color: primaryColor
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: colorIndicator.right
                    right: parent.right
                    margins: unit
                }

                font.pixelSize: 12
                elide: Text.ElideRight
            }
        }
        Column {
            id: layoutItem
            anchors.verticalCenter: parent.verticalCenter
            spacing: node.maxDepth == (node.depth+1) ? unit : 4*unit
        }
    }

    Repeater {
        model: node.childrenCount

        BezierLine {
            property Item targetItem: layoutItem.children[model.index]
            property real originY: box.y + (2+model.index)*box.height/(3+node.childrenCount)
            property real targetY: targetItem.y + targetItem.height/2

            x: node.width
            width: row.spacing
            height: parent.height

            contextPoint: [-lineWidth, originY]
            firstControlPoint: [width/3, originY]
            secondControlPoint: [width*2/3, targetY]
            endPoint: [width, targetY]
        }
    }
}

