import QtQuick 2.2
import "components"

Page {

    Column {
        x: medium
        y: medium
        width: parent.width - 2*x
        spacing: medium

        Grid {
            property int count: 25
            columns: 5
            width: parent.width
            columnSpacing: medium
            rowSpacing: small

            Repeater {
                model: parent.count

                Rectangle {
                    width: (parent.width - parent.columns*parent.columnSpacing + parent.columnSpacing)/parent.columns
                    height: width
                    color:  model.index == 8 ? highlightColor : primaryColor
                    radius: width/2
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width + small
                        height: width
                        color: "transparent"
                        border { width: tiny; color: primaryColor }
                        radius: width/2
                        visible: model.index % 9 == 1
                    }
                }
            }
        }

        Column {
            spacing: small
            width: parent.width
            Repeater {
                model: 3
                Label {}
            }
        }

    }

    Panel {
        anchors.bottom: parent.bottom
        Row {
            spacing: large
            anchors.centerIn: parent
            Repeater {
                model: 3
                Button {}
            }
        }
    }
}
