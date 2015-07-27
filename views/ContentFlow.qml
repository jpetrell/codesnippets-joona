import QtQuick 2.2
import "components"

Page {

    Row {
        id: buttonRow

        property int count: 4
        x: medium
        width: parent.width - 2*medium
        height: large
        spacing: small

        Button {
            anchors.verticalCenter: parent.verticalCenter
        }
        Item {
            height: medium
            width: parent.width - 3*buttonWidth - 3*parent.spacing
        }
        Button {
            anchors.verticalCenter: parent.verticalCenter
        }
        Button {
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Item {

        property real spacing: small

        clip: true
        x: medium
        width: parent.width - 2*x
        anchors {
            top: buttonRow.bottom
            bottom: parent.bottom
        }

        ContentItem {
            id: firstItem
            width: parent.width/2 - parent.spacing/2
            height: 2*large
        }
        ContentItem {
            id: secondItem
            color: highlightColor
            anchors.right: parent.right
            width: parent.width/2 - parent.spacing/2
            height: large
        }
        ContentItem {
            anchors {
                top: firstItem.bottom
                topMargin: parent.spacing
            }
            color: highlightColor
            height: medium
            width: parent.width/2 - parent.spacing/2
        }
        ContentItem {
            id: fourthItem
            height: large + medium
            anchors {
                top: secondItem.bottom
                left: firstItem.right
                margins: parent.spacing
            }

            width: parent.width/2 - parent.spacing/2
        }
        ContentItem {
            id: fifthItem

            width: parent.width
            height: medium
            anchors {
                top: fourthItem.bottom
                topMargin: parent.spacing
            }
        }
        Row {
            anchors {
                top: fifthItem.bottom
                topMargin: parent.spacing
            }
            width: parent.width
            spacing: parent.spacing
            ContentItem {
                width: parent.width/2 - parent.spacing/2
            }
            ContentItem {
                color: highlightColor
                width: parent.width/2 - parent.spacing/2
            }
        }
    }
}
