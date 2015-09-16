import QtQuick 2.2
import "components"

// View component, background overlay as the root item
Rectangle {

    property real unit: 10
    property real lineWidth: 2
    property real buttonWidth: 3/2*unit
    property real pageMargin: 2*unit

    property color primaryColor: "#f8f1e0"
    property color backgroundColor: "#99dbcd"
    property color contentColor: "#7295a6"
    property color highlightBackgroundColor: "#a791c9"
    property color layoutGridColor: "#ffffff"

    property int fontSizeSmall: 14
    property int fontSizeMedium: 16

    width: 24*unit
    height: 32*unit
    color: backgroundColor

    // Combined scroll area and list layout
    Column {
        anchors {
            top: parent.top
            bottom: toolbar.top
        }
        spacing: unit
        width: parent.width

        // Status area
        Rectangle {

            color: contentColor
            width: parent.width
            height: 2*unit

            Row {
                x: unit
                anchors.verticalCenter: parent.verticalCenter
                spacing: unit/2
                Repeater {
                    model: 2
                    Rectangle {
                        height: unit
                        width: unit
                        color: primaryColor
                    }
                }
            }
            Row {
                anchors {
                    right: parent.right
                    rightMargin: unit
                    verticalCenter: parent.verticalCenter
                }
                spacing: unit/2
                Repeater {
                    model: 3
                    Rectangle {
                        height: unit
                        width: unit
                        color: primaryColor
                    }
                }
            }
        }

        // Notification
        Row {
            id: row
            x: pageMargin
            spacing: unit
            width: parent.width - 2*x

            ContentItem {
                id: image
                height: 3*unit
                width: 3*unit
            }
            Paragraph {
                id: paragraph
                width: parent.width - parent.spacing - image.width
                lineCount: 3
            }
        }

        // Audio player widget
        Rectangle {
            color: highlightBackgroundColor
            x: pageMargin
            width: parent.width - 2*x
            height: content.height + unit
            Row {
                id: content

                x: unit/2
                y: unit/2
                spacing: unit/2
                width: parent.width - 2*x

                // Album art
                ContentItem {
                    id: album
                    opacity: 0.2

                    color: primaryColor

                    height: audioControls.height + audioControls.y
                    width: height
                }
                Column {
                    id: audioControls

                    y: unit
                    spacing: unit
                    width: parent.width - album.width - parent.spacing
                    Row {
                        spacing: 3*unit
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 1.5*unit

                        // Previous button
                        Row {
                            width: 2*unit
                            Rectangle {
                                color: primaryColor
                                width: lineWidth*2
                                height: buttonWidth
                            }
                            Polygon {
                                color: primaryColor
                                width: buttonWidth
                                height: buttonWidth
                                array: [[width,0], [0, height/2], [width, height]]
                            }
                        }

                        // Play button
                        Item {
                            width: buttonWidth
                            height: buttonWidth
                            Polygon {
                                color: primaryColor
                                width: buttonWidth
                                height: buttonWidth
                                array: [[0,0], [width, height/2], [0, height]]
                                anchors {
                                    centerIn: parent
                                    horizontalCenterOffset: lineWidth*2
                                }
                            }
                        }

                        // Next button
                        Row {
                            Polygon {
                                color: primaryColor
                                width: buttonWidth
                                height: buttonWidth
                                array: [[0,0], [width, height/2], [0, height]]
                            }
                            Rectangle {
                                color: primaryColor
                                width: lineWidth*2
                                height: buttonWidth
                            }
                        }
                    }

                    // Progress bar
                    Rectangle {
                        color: Qt.rgba(primaryColor.r, primaryColor.g, primaryColor.b, 0.6)
                        height: unit/2
                        width: parent.width
                        Rectangle {
                            color: primaryColor
                            width: parent.width/2
                            height: parent.height
                        }
                    }
                }
            }
        }

        // Shortcut row
        Rectangle {
            x: pageMargin
            width: parent.width - 2*x
            height: shortcutRow.height + unit
            color: Qt.rgba(primaryColor.r, primaryColor.g, primaryColor.b, 0.5)

            Row {
                id: shortcutRow
                anchors.verticalCenter: parent.verticalCenter
                Repeater {
                    model: 4
                    Column {
                        width: 5*unit
                        spacing: unit/2
                        ContentItem {
                            width: 2*unit
                            height: 2*unit
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Label {
                            x: unit/2
                            width: 4*unit
                        }
                    }
                }
            }
        }

        // Gallery widget
        Row {
            x: pageMargin
            Repeater {
                model: [0.9, 0.4, 1, 0.1]

                // Gallery photo
                ContentItem {
                    color: Qt.tint("white", Qt.rgba(contentColor.r, contentColor.g, contentColor.b, 0.3+0.7*modelData))
                    anchors.verticalCenter: parent.verticalCenter
                    height: 5*unit
                    width: 5*unit
                    Polygon {
                        color: highlightBackgroundColor
                        opacity: 0.5
                        width: parent.width
                        height: parent.height
                        rotation: model.index * 90
                        array: [[0,0], [width, 0], [0, height]]
                    }
                }
            }
        }

        // Event widget
        Row {
            x: pageMargin
            width: parent.width - 2*x
            spacing: unit

            // Date item
            Rectangle {
                id: dateItem

                height: 4*unit
                width: 5*unit
                color: contentColor
                Column {
                    anchors.centerIn: parent
                    Text {
                        text: "JUL"
                        color: primaryColor
                        font.pixelSize: fontSizeSmall
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: "15"
                        font.weight: Font.Bold
                        color: primaryColor
                        font.pixelSize: fontSizeMedium
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            // Date details
            Column {
                width: parent.width - dateItem.width - parent.spacing
                spacing: unit
                Row {
                    spacing: unit
                    width: parent.width
                    Label {
                        height: unit
                        width: parent.width*2/3
                    }
                    Label {
                        height: unit
                        width: parent.width/3 - parent.spacing
                    }
                }
                Paragraph {
                    lineCount: 2
                    width: parent.width
                }
            }
        }
    }

    // Toolbar
    Item {
        id: toolbar

        width: parent.width
        anchors.bottom: parent.bottom

        Row {
            property int count: 3
            property real toolButtonWidth: 2*unit

            x: pageMargin
            width: parent.width - 2*pageMargin
            spacing: Math.round((width - count*toolButtonWidth)/(count-1))
            anchors {
                bottom: parent.bottom
                bottomMargin: unit
            }

            Repeater {
                model: parent.count

                // Tool button
                Rectangle {
                    radius: width/2
                    color: primaryColor
                    width: parent.toolButtonWidth
                    height: parent.toolButtonWidth
                }
            }
        }
    }
    LayoutGrid {}
}
