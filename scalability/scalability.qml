import QtQuick 2.2
import "components"

Rectangle {

    property real tiny:  Math.round(extraSmall*2/3)
    property real extraSmall: Math.round(small*2/3)
    property real small: 7
    property real medium: 2*small
    property real large: 2*medium
    property real pageMargin: small + extraSmall
    property real fontSize: 18
    property real buttonWidth: 9

    property color primaryColor: "#f8f1e0"
    property color pageColor: "#99dbcd"
    property color backgroundColor: "#ebdfc3"
    property color titleColor: "#587280"
    property color contentColor: "#7295a6"
    property color panelColor: "#a791c9"

    width: row.width + 2*large
    height: row.y + row.height + medium
    color: backgroundColor

    Row {
        id: row

        y: large
        spacing: medium + tiny
        anchors.horizontalCenter: parent.horizontalCenter

        Page {
            title: "Phone"
            anchors.bottom: parent.bottom
            Inbox { anchors.fill: parent }
            Toolbar {}
        }

        Page {
            title: "Tablet"
            width: 18*medium
            contentHeight: 13*medium
            anchors.bottom: parent.bottom
            Row {
                anchors.fill: parent
                Inbox {
                    width: parent.width/3
                    height: parent.height
                    itemHeight: medium + extraSmall
                }
                EmailViewer {
                    height: parent.height
                    width: parent.width *2/3
                    Toolbar { count: 4 }
                }
            }
        }

        Page {
            title: "Desktop"
            width: 24*medium
            contentHeight: 14*medium
            Column {
                anchors.fill: parent
                MenuBar { id: menuBar }
                Row {
                    width: parent.width
                    height: parent.height - menuBar.height
                    Inbox {
                        itemHeight: medium
                        height: parent.height
                        width: parent.width/4
                    }
                    Column {
                        width: parent.width * 3/4
                        height: parent.height
                        ActionPanel {
                            id: actionPanel
                        }
                        EmailViewer {
                            height: parent.height - actionPanel.height
                            width: parent.width
                        }
                    }
                }
            }
        }
    }
}
