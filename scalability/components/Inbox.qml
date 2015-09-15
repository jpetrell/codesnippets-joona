import QtQuick 2.2

Item {
    property real itemHeight: medium + small
    ListView {
        model: 20
        spacing: small
        anchors {
            fill: parent
            margins: pageMargin
            bottomMargin: 0
        }
        delegate: ContentItem {
            width: parent.width
            height: itemHeight
        }
    }
}

