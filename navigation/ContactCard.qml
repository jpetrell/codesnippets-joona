import QtQuick 2.2
import "components"

Page {
    Column {
        width: parent.width
        spacing: small + tiny

        Panel {
            Button {
                x: small
                anchors.verticalCenter: parent.verticalCenter
            }
            OptionsButton {
                anchors {
                    right: parent.right
                    rightMargin: small
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        Row {
            x: small
            width: parent.width - 2*x
            spacing: small

            Avatar {
                id: avatar
                color: highlightColor
                width: 1/3 * parent.width
                height: column.height
            }
            Column {
                id: column
                spacing: small
                width: 2/3 * parent.width - parent.spacing
                Repeater {
                    model: 4
                    Label {}
                }
            }
        }

        Column {
            width: parent.width
            spacing: small
            Repeater {
                model: 2
                Row {
                    spacing: small
                    x: small
                    width: parent.width - 2*x
                    Repeater {
                        model: 2
                        ContactDetail {
                            width: (parent.width-parent.spacing)/2
                        }
                    }
                }
            }
        }

        ContactDetail {
            x: small
            lineCount: 3
            width: parent.width - 2*x
        }
    }
}
