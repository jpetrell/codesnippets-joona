import QtQuick 2.0
import "components"

Page {
    Rectangle {
        id: statusPanel
        height: medium
        width: parent.width
        color: Qt.rgba(0.3,0.8,0.3,1)
        Label {
            x: small
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/2
        }
    }
    Avatar {
        id: avatar

        x: large+tiny
        height: width
        width: parent.width - 2*x
        anchors {
            top: statusPanel.bottom
            topMargin: medium
        }
    }

    // Call duration
    Text {
        text: "01:23:45"
        color: primaryColor
        font.pixelSize: fontSizeMedium
        verticalAlignment: Text.AlignVCenter
        height: large
        anchors {
            top: avatar.bottom
            bottom: column.top
            horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        id: column

        width: parent.width
        anchors.bottom: parent.bottom

        // End call button
        Rectangle {
            width: parent.width
            height: large - extraSmall
            color: highlightColor

            // End call icon
            Polygon {
                height: small+tiny
                width: 3*medium
                color: primaryColor
                anchors {
                    centerIn: parent
                    verticalCenterOffset: height/5
                }
                array: [[0, height], [0, 0], [width, 0], [width,height], [width*4/5, height],
                    [width*4/5, height*3/5],[width/5, height*3/5], [width/5, height]]
            }
        }

        // Toolbar
        Panel {
            Row {
                spacing: medium
                anchors.centerIn: parent
                Repeater {
                    model: 4
                    Button {}
                }
            }
        }
    }
}
