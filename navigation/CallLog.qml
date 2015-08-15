import QtQuick 2.2
import "components"

Page {

    Column {
        y: small
        width: parent.width
        Repeater {
            model: 7

            Item {
                property bool highlighted: model.index === 1
                width: parent.width
                height: large - tiny
                Row {
                    id: row
                    x: small
                    spacing: small
                    width: parent.width - 2*x
                    anchors.verticalCenter: parent.verticalCenter

                    ContentItem {
                        id: contentItem
                        height: extraSmall
                        width: extraSmall
                        opacity: model.index === 0 || model.index === 3 ? 0.0 : 1.0
                        color: highlighted ? highlightColor : implicitColor
                    }
                    Column {
                        id: column
                        spacing: extraSmall
                        width: parent.width - 2*parent.spacing - contentItem.width - button.width
                        anchors.verticalCenter: parent.verticalCenter
                        Label {
                            color: highlighted ? highlightColor : primaryColor
                        }
                        Row {
                            width: parent.width
                            spacing: small
                            Label {
                                color: highlighted ? highlightColor : primaryColor
                                width: parent.width*2/3
                                height: extraSmall
                                opacity: 0.7
                            }
                        }

                    }
                    Rectangle {
                        id: button
                        color: highlighted ? highlightColor : primaryColor
                        width: buttonWidth
                        height: buttonWidth
                        radius: width/3
                    }
                }
            }
        }
    }
    Panel {
        anchors.bottom: parent.bottom
        height: buttonRow.height + small

        Row {
            id: buttonRow
            spacing: large
            anchors.centerIn: parent

            LogButton {
                anchors.verticalCenter: parent.verticalCenter
            }
            DialerButton {
                id: dialerIcon
                anchors.verticalCenter: parent.verticalCenter

            }
            FavouriteButton {
                anchors.verticalCenter: parent.verticalCenter
                width: height
                height: dialerIcon.height + lineWidth
            }
        }
    }
}
