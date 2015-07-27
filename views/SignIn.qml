import QtQuick 2.2
import "components"

Page {

    ContentItem {
        id: banner
        value: 0.5
        width: parent.width; height: logo.height+2*medium

        ContentItem {
            id: logo
            value: 0.1
            anchors.centerIn: parent
            width: large
            height: large
        }
    }

    Column {
        anchors {
            top: banner.bottom
            topMargin: medium
        }

        x: medium
        spacing: small + extraSmall
        width: parent.width - 2*x

        Column {
            width: parent.width
            spacing: extraSmall

            TextField {}
            TextField {}

            Item { width: 1; height: 1 }

            Row {
                spacing: extraSmall
                width: parent.width
                height: label.height
                Button {
                    id: button
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label {
                    id: label
                    width: parent.width - parent.spacing - button.width
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Label {}
        }

        Row {
            spacing: small
            width: parent.width

            Rectangle {
                color: primaryColor
                width: parent.width/2 - parent.spacing/2
                height: buttonWidth
                radius: width/4
            }
            Rectangle {
                color: highlightColor
                width: parent.width/2 - parent.spacing/2
                height: buttonWidth
                radius: width/4
            }
        }
    }
}
