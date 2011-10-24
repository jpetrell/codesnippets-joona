import QtQuick 1.0

Rectangle {
    width: 800; height: 200
    property string label: "Hello world!"
    property variant fontFamilies: [ "Georgia", "Verdana", "Tahoma",
                                     "Lucida Console", "Century Gothic",
                                     "Courier New",  "Times New Roman"]
    function randomFont() {
        return fontFamilies[Math.floor(Math.random()*fontFamilies.length)]
    }
    Row {
        id: row
        spacing: -10-10*Math.random()
        anchors.centerIn: parent
        Repeater {
            model: label.length
            Text {
                text: label[index]
                opacity: 0.5+0.5*Math.random()
                anchors.verticalCenter: parent.verticalCenter
                property real distance: 2*Math.abs(index-label.length/2) /
                                        label.length
                font {
                    family: randomFont()
                    capitalization: Font.AllUppercase
                    pixelSize: 130+30*Math.random()-50*distance
                }
                Repeater {
                    model: 5+5*Math.random()
                    Text {
                        text: parent.text
                        opacity: 0.6+0.4*Math.random()
                        anchors.centerIn: parent
                        font {
                            family: randomFont()
                            capitalization: Font.AllUppercase
                            pixelSize: 130+30*Math.random()-50*distance
                        }
                    }
                }
            }
        }
    }
}
