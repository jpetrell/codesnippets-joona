import QtQuick 2.0
import "components"
import "../view"

Rectangle {
    id: root

    property int unit: 5
    property int lineWidth: Math.round(unit*2/5)
    property color backgroundColor: "#A8C7D9"
    property color primaryColor: "#F4EEE5"
    property color panelColor: "#203864"
    property color highlightColor: "#f34955"
    property color buttonColor: "#E7DD73"
    property color contentColor: Qt.tint("white", Qt.rgba(highlightColor.r, highlightColor.g, highlightColor.b, 0.5))

    width: Math.max(800, row.width+unit*6)
    height: Math.max(420, row.height+unit*4)
    color: "#E3EDF3"

    Row {
        id: row
        spacing: 6*unit
        anchors.centerIn: parent

        View {
            id: view
            unit: 2*root.unit
            anchors.verticalCenter: parent.verticalCenter
        }
        Node {
            text: "Background"
            color: backgroundColor
            width: 22*unit
            Node {
                text: "Background"
                color: primaryColor
                width: 22*unit
                Node {
                    text: "View logo"
                    color: highlightColor
                    width: 25*unit
                }
                Node {
                    text: "Search button"
                    color: backgroundColor
                    width: 25*unit
                }
            }
            Node {
                text: "Scroll area"
                width: 22*unit
                Node {
                    text: "List layout"
                    Repeater {
                        model: 4
                        Node {
                            property bool more: model.index === 2
                            text: more ? "..." : "List item"
                            color: more ? "transparent" : contentColor
                            width: 18*unit
                        }
                    }
                }
            }
            Node {
                text: "Background"
                width: 22*unit
                color: panelColor
                Node {
                    text: "List layout"
                    Repeater {
                        model: 4
                        Node {
                            text: "Button"
                            color: buttonColor
                            width: 18*unit
                        }
                    }
                }
            }
        }
    }
}
