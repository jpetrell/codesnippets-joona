import QtQuick 2.2

Rectangle {
    color: primaryColor
    Column {
        x: pageMargin
        y: pageMargin
        width: parent.width - 2*x
        spacing: small + extraSmall
        Column {
            spacing: small
            width: parent.width
            Label {
                width: 3*large
            }
            Row {
                spacing: extraSmall
                Label {
                    width: large + medium
                }
                Label {
                    width: large
                }
                Label {
                    width: large
                }
            }
        }

        Label {
            color: backgroundColor
        }
        Column {
            spacing: small
            width: parent.width
            Row {
                width: parent.width
                spacing: small
                ContentItem {
                    id: picture
                    color: pageColor
                    width: large + medium
                    height: paragraph.height
                }
                Paragraph {
                    id: paragraph
                    width: parent.width - parent.spacing - picture.width
                    lineCount: 4
                }
            }
            Paragraph {
                width: parent.width
                lineCount: 24*large/parent.width
            }
        }
        Label {
            width: parent.width/2
        }
    }
}
