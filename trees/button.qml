import QtQuick 2.0
import "components"
import "../button"

Rectangle {
    property real unit: 5
    property real lineWidth: 2
    property color backgroundColor: "#A8C7D9"
    property color primaryColor: "#F4EEE5"
    property color panelColor: "#203864"
    property color highlightColor: "#f34955"
    property color buttonColor: "#E7DD73"

    width: 800
    height: 160
    color: "#E3EDF3"

    Row {
        id: row
        spacing: 6*unit
        anchors.centerIn: parent

        Button {
            id: view
            anchors.verticalCenter: parent.verticalCenter
        }
        Node {
            text: "Background"
            color: highlightColor
            width: 22*unit

            Node {
                text: "List layout"
                Node {
                    text: "Icon"
                    color: buttonColor
                    width: 14*unit
                }
                Node {
                    text: "Label"
                    color: primaryColor
                    width: 14*unit
                }
            }
            Node {
                text: "Touch area"
                color: "transparent"
            }
        }
    }
}
