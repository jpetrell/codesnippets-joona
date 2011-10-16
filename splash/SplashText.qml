import QtQuick 1.0
 
Rectangle {
    id: splashText
    property string text: "Splash!"
    width: 440; height: 160
    property bool reverse: Math.random() > 0.5
    color: Qt.rgba(0.5+0.5*Math.random(), 0.2+0.4*Math.random(),
                   0.2+0.2*Math.random())
    transform: Rotation {
        origin.x: splashText.width/2
        origin.y: splashText.height/2
        property real value: Math.random()
        axis.x: Math.random() < 0.2 || value < 0.3
        axis.y: Math.random() < 0.2 || value >= 0.3 && value < 0.7
        axis.z: Math.random() < 0.2 || value >= 0.7
        SequentialAnimation on angle {
            loops: Animation.Infinite
            NumberAnimation {
                from: 0.0; to: reverse ? -20.0 : 20.0
                duration: 500; easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                from: reverse ? -20.0 : 20.0; to: 0.0
                duration: 500; easing.type: Easing.InOutQuad
            }
        }
    }
    Repeater {
        model: 20
        Rectangle {
            height: Math.random()*parent.height
            width: 0.4*Math.random()*parent.width
            color: Qt.rgba(0.6+0.5*Math.random(), 0.4+0.4*Math.random(),
                           0.2+0.4*Math.random(), 0.5+0.5*Math.random())
            x: Math.random() > 0.3 ? Math.random()*parent.width - width/2 :
               Math.random()*width - width + (Math.random() > 0.5 ? parent.width : 0)
            y: Math.random()*parent.height - height/2
        }
    }
    Repeater {
        model: 5
        Text {
            text: splashText.text
            color: "white"
            font.pixelSize: 70+Math.random()*10
            anchors {
                centerIn: parent
                horizontalCenterOffset: 3*Math.random()
                verticalCenterOffset: 4*Math.random()
            }
        }
    }
}