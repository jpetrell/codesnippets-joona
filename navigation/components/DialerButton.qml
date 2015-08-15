import QtQuick 2.0

Grid {
    columns: 3
    columnSpacing: tiny
    rowSpacing: lineWidth/2

    Repeater {
        model: 12

        Rectangle {
            color: primaryColor
            width: small/2
            height: small/2
            opacity: model.index === 9 || model.index === 11 ? 0.0 : 1.0
            radius: height/3
        }
    }
}
