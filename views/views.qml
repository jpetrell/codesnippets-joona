import QtQuick 2.2
import "components"

Rectangle {

    property int unit: 3
    property int tiny: unit
    property int extraSmall: 2*tiny
    property int small: 3*tiny
    property int medium: 2*small
    property int large: 2*medium
    property int huge: 6*small

    property int fontSizeSmall: 6*unit
    property int fontSizeMedium: 9*unit
    property int fontSizeLarge: 12*unit

    property int lineWidth: unit*1.5
    property real buttonWidth: 4*unit

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
