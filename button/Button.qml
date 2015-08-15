import QtQuick 2.0
import "components"

Item {
    property real unit: 10
    property color primaryColor: "#F4EEE5"
    property color secondaryColor: "#E3EDF3"
    property color highlightColor: "#203864"
    property color backgroundColor: "#F34955"
    property color contentColor: "#E7DD73"
    property color buttonColor: "#E7DD73"

    height: 6*unit
    width: 18*unit

    Rectangle {
        id: background

        radius: unit
        color: mouseArea.containsMouse ? highlightColor : backgroundColor
        anchors.fill: parent
    }
    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onClicked: console.log("Button clicked")
    }
    Row {
        x: unit
        spacing: unit
        width: parent.width - 3*x
        anchors.verticalCenter: parent.verticalCenter
        Icon {
            id: icon
            width: 4*unit
            height: 4*unit
            highlighted: mouseArea.containsMouse
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            id: label

            text: "Favorite"
            font.pixelSize: 26
            elide: Text.ElideRight
            width: parent.width - parent.spacing - icon.width
            anchors.verticalCenter: parent.verticalCenter
            color: mouseArea.containsMouse ? secondaryColor : primaryColor
        }
    }
}
