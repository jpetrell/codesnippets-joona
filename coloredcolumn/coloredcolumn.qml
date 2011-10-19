import QtQuick 1.0

Column {
    width: 800; height: 400
    property real weight
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
        model: 20
        Rectangle {
            property real ratio: Math.pow(Math.random(),3)
            height: Math.ceil(ratio*parent.weight)
            width: parent.width
            color: Qt.rgba(0.5+0.3*Math.random(),
                           0.5+0.3*Math.random(),
                           0.5+0.3*Math.random())
        }
    }
}
