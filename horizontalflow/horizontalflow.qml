import QtQuick 1.0

Rectangle {
    color: "black"
    width: 800; height: 300
    HorizontalPathView {
        id: albumView
        model: Model { id: albumModel }
        delegate: Delegate {}
        anchors.fill: parent
    }
    AlphabeticScrollbar {
        alphabets: albumModel.alphabets
        alphabetIndeces: albumModel.alphabetIndeces
        view: albumView
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 3
            rightMargin: 3
        }
    }
}
