import QtQuick 1.0

Rectangle {
    width: grid.width+100; height: grid.height+100
    property real letterHeight
    property real letterWidth
    property string alphabets: "abcdefghijklmnopqrstuvwxyzåäö"
    property variant fontFamilies: [ "Castellar", "Century Gothic",
                                     "Courier New", "Bodoni MT Condensed",
                                     "AngsanaUPC", "Bodoni MT Black",
                                     "Copperplate Gothic Bold", "Pistilli",
                                     "Rockwell Extra Bold"]
    function randomFont() {
        return fontFamilies[Math.floor(Math.random()*fontFamilies.length)]
    }
    function resizeLetters() {
        var rows = alphabets.length/grid.columns
        letterHeight = Math.round(grid.height/rows)
        letterWidth = Math.round(grid.width/grid.columns)
        for (var index = 0; index < grid.children.length; index++) {
            var child = grid.children[index]
            if (child.width != undefined) {
                child.height = letterHeight
                child.width = letterWidth
            }
        }
    }
    Timer {
        interval: 50
        running: true
        onTriggered: resizeLetters()
    }
    Grid {
        columns: 6
        anchors { centerIn: parent; verticalCenterOffset: -15 }
        Repeater {
            model: alphabets.length
            Rectangle {
                height: letterHeight
                width: letterWidth
                color:  Qt.rgba(0.4+0.6*Math.random(),
                                0.4+0.6*Math.random(),
                                0.4+0.6*Math.random())
            }
        }
    }
    Grid {
        id: grid
        columns: 6
        anchors { centerIn: parent; verticalCenterOffset: -15 }
        Repeater {
            model: alphabets.length
            Text {
                text: alphabets[index]
                font {
                    pixelSize: 120
                    family: randomFont()
                    capitalization: Font.AllUppercase
                }
                Repeater {
                    model: 3+Math.random()*2
                    Text {
                        text: parent.text
                        anchors.centerIn: parent
                        font {
                            pixelSize: 120
                            family: randomFont()
                            capitalization: Font.AllUppercase
                        }
                    }
                }
            }
        }
    }
}
