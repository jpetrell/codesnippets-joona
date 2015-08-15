import QtQuick 2.2
import "components"

Rectangle {
    id: navigation

    property real tiny: 3
    property real extraSmall: 6
    property real small: 8
    property real medium: 16
    property real large: 32
    property real huge: 48

    property real lineWidth: 3
    property real buttonWidth: 12
    property real pageWidth: 10*medium
    property real pageHeight: 13*medium

    property color primaryColor: "#F4EEE5"
    property color pageColor: "#A8C7D9"
    property color backgroundColor: "#E3EDF3"
    property color panelColor: "#203864"
    property color highlightColor: "#f34955"
    property color contentColor: "#e3d43e"

    property int fontSizeMedium: 16
    property int fontSizeLarge: 20

    width: 800
    height: grid.height + 2*large
    color: backgroundColor

    Grid {
        id: grid

        columns: 4
        columnSpacing: large
        rowSpacing: small
        anchors.centerIn: parent

        CallLog {}
        ContentGrid {}
        PeopleSearch {}
        Switcher {}
        Repeater {
            model: ["Call history", "Photo grid", "Contact search", "App switcher"]
            Title {
                text: modelData
            }
        }

        Repeater {
            model: 4
            Item { width: 1; height: 1 }
        }

        Repeater {
            model: 4
            Page {
                height: 2*medium
                color: "transparent"
                Arrow {
                    color: pageColor
                    anchors.centerIn: parent
                }
            }
        }

        Repeater {
            model: 4
            Item { width: 1; height: small }
        }

        Call {}
        Photo {}
        ContactCard {}
        App {}
        Repeater {
            model: ["Call", "Photo", "Contact", "App"]
            Title {
                color: chromeColor
                text: modelData
            }
        }
    }
}
