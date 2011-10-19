import QtQuick 1.0

Row {
    property real weight
    property real count: 50
    width: 800; height: 400
    Component.onCompleted: {
        var ratioCount = 0
        for (var index = 0; index < children.length; index++) {
            if (children[index] !== repeater)
                ratioCount += children[index].ratio
        }
        weight = width/ratioCount
    }
    Repeater {
        id: repeater
        model: parent.count
        ColoredColumn {
            height: parent.height
            width: Math.ceil(ratio*parent.weight)
            property real ratio: Math.pow(Math.random(),3)
        }
    }
}
