import QtQuick 1.0
 
Rectangle {
    width: 800; height: 400
    Loader {
        anchors.centerIn: parent
        Component.onCompleted: reload()
        function reload() {
            source = ""
            source = "SplashText.qml"
            parent.color = Qt.rgba(0.7 + 0.2*Math.random(),
                                   0.7 + 0.2*Math.random(),
                                   0.9 + 0.1*Math.random())
        }
        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: parent.reload()
        }
    }
}