import QtQuick 1.0

Rectangle {
    color: Qt.rgba(1.0, 0.9, 0.6)
    width: 800; height: 500
    TimePickerDialog {
        id: timePickerDialog
        anchors.centerIn: parent
    }
    Button {
        width: 130
        text: "Open"
        anchors.centerIn: parent
        onClicked: timePickerDialog.show()
    }
}
