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

    width: row.width+unit*6
    height: row.height+unit*4
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

        ItemNode {
            text: "Background"
            color: backgroundColor
            width: 22*unit
            ItemNode {
                text: "Background"
                color: primaryColor
                width: 22*unit
                ItemNode {
                    text: "View logo"
                    color: highlightColor
                    width: 25*unit
                }
                ItemNode {
                    text: "Search button"
                    color: backgroundColor
                    width: 25*unit
                }
            }

            ItemNode {
                text: "Scroll area"
                width: 22*unit
                ItemNode {
                    text: "List layout"
                    Repeater {
                        model: 4
                        ItemNode {
                            property bool more: model.index === 2
                            text: more ? "..." : "List item"
                            color: more ? "transparent" : contentColor
                            width: 18*unit
                        }
                    }
                }
            }

            ItemNode {
                text: "Background"
                width: 22*unit
                color: panelColor
                ItemNode {
                    text: "List layout"
                    Repeater {
                        model: 4
                        ItemNode {
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
