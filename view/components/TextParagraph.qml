import QtQuick 2.0

Column {
    spacing: unit/2
    Repeater {
        model: 3
        Rectangle {
            color: primaryColor
            width: model.index % 3 === 2 ? parent.width/2 + Math.random()*parent.width/2
                                         : parent.width
            height: unit/2
            radius: height/2
        }
    }
}
