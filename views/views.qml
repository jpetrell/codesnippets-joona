import QtQuick 2.2
import "components"

Rectangle {

    property real tiny: 2
    property real extraSmall: 4
    property real small: 6
    property real medium: 12
    property real large: 24
    property real huge: 30

    property real fontSizeSmall: 12
    property real fontSizeMedium: 18
    property real fontSizeLarge: 24

    property real lineWidth: 3
    property real buttonWidth: 8

    property color primaryColor: "#fdf5e0"
    property color pageColor: "#6fbfa8"
    property color backgroundColor: "#fdf5e0"
    property color panelColor: "#353537"
    property color highlightColor: "#f87d60"
    property color contentColor: "#e3d43e"

    width: grid.width + 2*large
    height: grid.height + 2*large
    color: backgroundColor

    Grid {
        id: grid

        columns: 6
        spacing: medium+small
        anchors.centerIn: parent

        ContentGrid {}
        Card {}
        Keypad {}
        Map {}
        Widgets {}
        Switcher {}

        SignIn {}
        Viewfinder {}
        ContentFlow {}
        Calendar {}
        LockScreen {}
        Form {}

        Conversation {}
        AudioPlayer {}
        List {}
        Tutorial {}
        Search {}
        WebView {}
    }
}
