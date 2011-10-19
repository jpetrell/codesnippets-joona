import QtQuick 1.0

Column {
    id: coloredColumn
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
        Rectangle {
            width: parent.width
            color: Qt.rgba(red, green, blue)
            height: Math.ceil(ratio*parent.weight)
            property real value: Math.random()
            property real ratio: Math.pow(Math.random(),3)
            property real red: value < 0.4 ? 0.8+0.2*Math.random() : 0.1+0.4*Math.random()
            property real green: value > 0.4 && value < 0.8 ? 0.7+0.3*Math.random() : 0.4+0.3*Math.random()
            property real blue: value > 0.8 ? 0.6+0.2*Math.random() : 0.2*Math.random()
        }
    }
}
