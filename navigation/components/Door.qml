import QtQuick 2.0

Rectangle {
    z: -1
    radius: tiny
    color: primaryColor
    width: small
    height: medium+small
    anchors {
        bottom: parent.top
        bottomMargin: -radius
    }
}
