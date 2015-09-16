import QtQuick 2.2

Column {
    property int lineCount: 3
    spacing: unit/2
    Repeater {
        model: lineCount
        Label {
            width: model.index % lineCount === lineCount-1 ? parent.width/2 + Math.random()*parent.width/2
                                                           : parent.width
        }
    }
}
