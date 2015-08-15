import QtQuick 2.2
import "components"

// View component, background overlay as the root item
Rectangle {

    property real unit: 10
    property color backgroundColor: "#A8C7D9"
    property color primaryColor: "#F4EEE5"
    property color panelColor: "#203864"
    property color highlightColor: "#f34955"
    property color buttonColor: "#E7DD73"
    property color contentColor: Qt.tint("white", Qt.rgba(highlightColor.r, highlightColor.g, highlightColor.b, 0.5))

    width: 24*unit
    height: 32*unit
    color: backgroundColor

    // Combined scroll area and list layout
    ListView {
        anchors {
            top: parent.top
            bottom: toolbar.top
        }
        width: parent.width
        model: 30

        // Heading panel
        header: Column {
            width: parent.width

            // Heading background
            Rectangle {

                color: primaryColor
                width: parent.width
                height: 4*unit

                // View logo
                ContentItem {
                    x: unit
                    anchors.verticalCenter: parent.verticalCenter
                    color: highlightColor
                    width: 3*unit
                    height: 3*unit
                }

                // Search button
                SearchButton {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: unit
                    }
                }
            }

            // Empty spacer item
            Item {
                height: unit/2
                width: parent.width
            }
        }

        // Content item
        delegate: Item {

            height: 4*unit
            width: parent.width

            Row {
                id: row
                x: unit
                spacing: unit
                width: parent.width - 2*x
                anchors.verticalCenter: parent.verticalCenter

                // Image
                ContentItem {
                    id: image
                    anchors.verticalCenter: parent.verticalCenter
                    height: 3*unit
                    width: 3*unit
                }

                // Paragraph
                TextParagraph {
                    width: parent.width - parent.spacing - image.width
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }

    Item {
        id: toolbar

        height: 4*unit
        width: parent.width
        anchors.bottom: parent.bottom

        // Toolbar background
        Rectangle {
            anchors.fill: parent
            color: panelColor
        }

        // Row layout
        Row {
            property int count: 4
            width: parent.width - 2*unit
            spacing: (width - count * 2*unit)/(count-1)
            anchors.centerIn: parent
            Repeater {
                model: parent.count

                // Button
                Button {}
            }
        }
    }
}
