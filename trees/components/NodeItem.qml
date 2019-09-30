import QtQuick 2.0

Item {
    property QtObject node
    property alias layout: layoutItem
    default property alias content: loader.sourceComponent
    property alias contentItem: loader.item

    objectName: "nodeItem"
    width: row.width
    height: row.height

    Row {
        id: row
        spacing: node.spacing

        Loader {
            id: loader
            anchors.verticalCenter: parent.verticalCenter
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
            property real originY: loader.y + (2+model.index)*loader.height/(3+node.childrenCount)
            property real targetY: targetItem.y + targetItem.height/2
z: -1
            x: node.width - unit
            width: row.spacing + unit
            height: parent.height

            contextPoint: [-lineWidth, originY]
            firstControlPoint: [width/3, originY]
            secondControlPoint: [width*2/3, targetY]
            endPoint: [width, targetY]
        }
    }
}

