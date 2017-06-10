import QtQuick 2.6
import "components"

Rectangle {
    readonly property int unit: 2
    readonly property int small: unit
    readonly property int medium: 14*unit
    readonly property int large: 2*medium
    readonly property int huge: 2*large

    width: row.width + 4*huge
    height: row.height + 2*large
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#222222"
        }
        GradientStop {
            position: 1.0
            color: "#111111"
        }
    }

    Row {
        id: row
        height: 10*large
        anchors.centerIn: parent

        Line { topMultiplier: 3*Math.random(); bottomMultiplier: 3*Math.random() }
        Item { width: medium; height: 1 }
        Line { topMultiplier: 3*Math.random(); bottomMultiplier: 3*Math.random() }

        Item { width: large; height: 1 }

        Line { topMultiplier: 3*Math.random(); bottomMultiplier: 3*Math.random() }
        Item { width: medium; height: 1 }
        Line { topMultiplier: 3*Math.random(); bottomMultiplier: 3*Math.random() }

        Item { width: large; height: 1 }

        Line { topMultiplier: 3*Math.random(); bottomMultiplier: 3*Math.random() }
        Item { width: medium; height: 1 }
        Line { topMultiplier: 3*Math.random(); bottomMultiplier: 3*Math.random() }
    }
}
