import QtQuick 1.0

Rectangle {
    color: "black"
    width: 800; height: 400
    HorizontalPathView {
        id: horizontalPathView
        model: Model { id: model }
        delegate: Delegate {}
        anchors.fill: parent
    }
    AlphabeticScrollbar {
        view: horizontalPathView
        alphabets: model.alphabets
        alphabetIndeces: model.alphabetIndeces
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 3
            rightMargin: 3
        }
    }
}
