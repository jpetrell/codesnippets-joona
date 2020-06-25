import QtQuick 2.6
import LineGraph 1.0

Rectangle {
    property int unit: 100
    width: 12 * unit
    height: 4 * unit

    LineGraph {
        lineWidth: unit/10
        color: "black"
        values: [0.0, 1.0, 0.5, 0.75, 0.25, 0.0]
        anchors {
            fill: parent
            margins: unit
        }
    }
}
