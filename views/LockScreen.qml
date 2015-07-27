import QtQuick 2.2
import "components"

Page {

    Column {
        y: parent.height/6
        width: parent.width - 2*x
        x: large
        spacing: small

        Text {
            text: "12:03"
            color: primaryColor
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: fontSizeLarge
        }
        Label {}
        Label {}
    }

    Row {
        spacing: small
        anchors {
            bottom: parent.bottom
            bottomMargin: large
            horizontalCenter: parent.horizontalCenter
        }

        Button {}
        Button {}
        Button {}
    }
}
