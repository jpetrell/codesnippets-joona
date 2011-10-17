import QtQuick 1.0

Rectangle {
    id: timePicker
    property int hours
    property int minutes
    property string text: qsTr("Set time to")
    z: 2
    radius: 4
    scale: 0.0
    color: Qt.rgba(0.1, 0.1, 0.1, 0.9)
    width: 320; height: contentColumn.height + 4
    border { width: 2; color: Qt.rgba(1.0, 1.0, 1.0, 0.2) }
    signal finished
    signal canceled
    onFinished: timePicker.state = ""
    onCanceled: timePicker.state = ""
    function show() {
        state = "visible"
    }
    function formatTime() {
        var time = new Date()
        time.setHours(hours)
        time.setMinutes(5*Math.round(minutes/5))
        return Qt.formatDateTime(time, "hh:mm")
    }
    Column {
        id: contentColumn
        x: 2; width: parent.width - 4
        Text {
            color: "white"
            height: 80
            font.pixelSize: 32
            text: timePicker.text + " " + timePicker.formatTime()
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Rectangle {
            color: Qt.rgba(0.9, 0.9, 0.9)
            x: 10; y: 6; height: 300; width: parent.width - 20
            Row {
                clip: true
                spacing: 1
                anchors.fill: parent
                ListView {
                    id: hourList
                    width: parent.width/2; height: 300
                    model: ListModel {
                        id: hourModel
                        Component.onCompleted: {
                            for (var index = 0; index < 24;  index++)
                                append({"hours": index})
                            hourList.currentIndex =
                                Math.ceil(new Date().getHours())
                        }
                    }
                    delegate: TimePickerItem {
                        number: hours
                        onIsCurrentItemChanged: {
                            if (isCurrentItem)
                                timePicker.hours = hours
                        }
                    }
                    snapMode: ListView.SnapToItem
                    flickDeceleration: 1000
                    preferredHighlightBegin: 120; preferredHighlightEnd: 120
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    highlight: Item {}
                }
                ListView {
                    id: minuteList
                    width: parent.width/2; height: 300
                    model: ListModel {
                        id: minuteModel
                        Component.onCompleted: {
                            for (var index = 0; index < 12; index++)
                                append({"minutes": 5*index})
                            minuteList.currentIndex =
                                Math.ceil(new Date().getMinutes()/5)
                        }
                    }
                    delegate: TimePickerItem {
                        number: minutes
                        onIsCurrentItemChanged: {
                            if (isCurrentItem)
                                timePicker.minutes = minutes
                        }
                    }
                    snapMode: ListView.SnapToItem
                    flickDeceleration: 1000
                    preferredHighlightBegin: 120; preferredHighlightEnd: 120
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    highlight: Item {}
                }
            }
            Rectangle {
                // highlight
                height: 60; width: parent.width
                color: Qt.rgba(0.2, 0.5, 0.8, 0.4)
                anchors.centerIn: parent
            }
            Rectangle {
                height: 55; width: parent.width
                gradient: Gradient {
                    GradientStop { position: 1.0; color: Qt.rgba(0,0,0,0) }
                    GradientStop { position: 0.0; color: Qt.rgba(0,0,0,0.6) }
                }
                anchors.top: parent.top
            }
            Rectangle {
                height: 55; width: parent.width
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.rgba(0,0,0,0) }
                    GradientStop { position: 1.0; color: Qt.rgba(0,0,0,0.6) }
                }
                anchors.bottom: parent.bottom
            }
        }
        Item { width: 1; height: 10 }
        Row {
            height: 70; width: parent.width
            Button {
                text: qsTr("Ok")
                width: parent.width/2 - 2
                onClicked: timePicker.finished()
            }
            Rectangle {
                width: 2; height: 70
                color: Qt.rgba(1.0, 1.0, 1.0, 0.2)
            }
            Button {
                text: qsTr("Cancel")
                width: parent.width/2-2
                onClicked: timePicker.canceled()
            }
        }
    }
    Rectangle {
        id: fadeBackground
        z: 1
        opacity: 0.0
        color: Qt.rgba(0.0, 0.0, fadeBackgroundMouse.pressed ? 0.5 : 0.45)
        parent: timePicker.parent
        anchors.fill: parent
        MouseArea {
            id: fadeBackgroundMouse
            enabled: false
            anchors.fill: parent
            onClicked: timePicker.canceled()
        }
    }
    states: State {
        name: "visible"
        PropertyChanges { target: timePicker; scale: 1.0 }
        PropertyChanges { target: fadeBackgroundMouse; enabled: true }
        PropertyChanges { target: fadeBackground; opacity: 0.45 }
    }
    transitions: Transition {
        NumberAnimation {
            properties: "opacity, scale"
            duration: 500; easing.type: Easing.InOutQuad
        }
    }
}
