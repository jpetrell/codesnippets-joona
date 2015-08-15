import QtQuick 2.0
import "components"

Page {

    Column {
        y: small
        width: parent.width
        spacing: small+tiny

        Row {
            x: small
            spacing: small + extraSmall
            width: parent.width - 2*x

            TextField {
                width: parent.width - button.width - parent.spacing
            }
            SearchButton {
                id: button
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Column {
            x: small
            spacing: small
            width: parent.width - 2*x
            Repeater {
                model: 4
                Row {
                    property bool highlighted: model.index === 1
                    id: row
                    spacing: small
                    width: parent.width
                    ContentItem {
                        id: contentItem
                        anchors.verticalCenter: parent.verticalCenter
                        height: column.height
                        width: column.height
                        color: highlighted ? highlightColor : implicitColor
                    }
                    Column {
                        id: column
                        spacing: extraSmall
                        width: parent.width - parent.spacing - contentItem.width
                        anchors.verticalCenter: parent.verticalCenter
                        Label {
                            color: highlighted ? highlightColor : primaryColor
                        }
                        Label {
                            opacity: 0.7
                            color: highlighted ? highlightColor : primaryColor
                        }
                    }
                }
            }
        }
    }

    Keyboard {}
}
