import QtQuick 1.0

Column {
    property real weight
    property real count: 40
    width: 800; height: 400
    Component.onCompleted: {
        var ratioCount = 0
        for (var index = 0; index < children.length; index++) {
            if (children[index] !== repeater)
                ratioCount += children[index].ratio
        }
        weight = height/ratioCount
    }
    Repeater {
        id: repeater
        model: parent.count
        ColoredRow {
            width: parent.width
            height: Math.ceil(ratio*parent.weight)
            property real ratio: Math.pow(Math.random(),3)
        }
    }
}
