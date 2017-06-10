import QtQuick 2.6

Rectangle {
    property int topMultiplier
    property int bottomMultiplier
    property color topColor: "#DDDDDD"
    property color centerColor: "#DDDDDD"
    property color bottomColor: "#555555"

    width: small
    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: topMultiplier*large
        bottomMargin: bottomMultiplier*large
    }

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: topColor
        }
        GradientStop {
            position: large/height
            color: topColor
        }
        GradientStop {
            position: large/height+0.01
            color: centerColor
        }
        GradientStop {
            position: 1 - large/height-0.01
            color: centerColor
        }
        GradientStop {
            position: 1 - large/height
            color: bottomColor
        }
        GradientStop {
            position: 1.0
            color: bottomColor
        }
    }
}
