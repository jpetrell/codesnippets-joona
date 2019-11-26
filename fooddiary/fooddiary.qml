import QtQuick 2.0

Rectangle {

    color: "white"
    width: column.width + 6 * paddingLarge
    height: column.height + 4 * paddingLarge

    property int unit: 60
    property int fontSizeTiny: unit/3
    property int fontSizeHuge: unit * 1.5
    property int paddingSmall: unit/10
    property int paddingMedium: 2 * paddingSmall
    property int paddingLarge: 2 * paddingMedium

    Label {
        id: dummyText
        text: "Dummy"
        width: 3*unit
        font.pixelSize: fontSizeTiny
        visible: false
    }

    Column {
        id: column

        spacing: 2 * paddingLarge
        anchors {
            centerIn: parent
            verticalCenterOffset: paddingLarge
        }

        Label {
            text: "Ruokapäiväkirja - Syksy 2019"
            font.pixelSize: fontSizeHuge
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Grid {
            columns: repeater.model.count/2
            rowSpacing: paddingLarge

            Repeater {
                id: repeater

                Column {
                    width: 2 * unit
                    spacing: paddingMedium

                    Label {
                        text: model.weekday
                        anchors.horizontalCenter: parent.horizontalCenter
                        opacity: model.weekday === "La" || model.weekday === "Su" ? 1.0 :  0.6
                        font.pixelSize: fontSizeTiny
                    }

                    Rectangle {
                        height: 3 * unit
                        width: 1 * unit - 2 * paddingSmall
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Qt.rgba(0.8, 0.8, 0.8, model.level >= 0 ? 0.5 : 0.4)

                        Label {
                            text: "?"
                            visible: model.level < 0
                            anchors.centerIn: parent
                        }

                        Rectangle {
                            color: {
                                if (model.level < 0) return "transparent"
                                if (model.level >= 3) return "red"
                                else if (model.level <= 1) return Qt.rgba(0.9, 0.9, 0.4)
                                else return "orange"
                            }
                            width: parent.width
                            anchors.bottom: parent.bottom
                            height: parent.height * model.level / 5
                        }
                    }

                    Label {
                        opacity: 0.6
                        text: model.day + "."
                        font.pixelSize: fontSizeTiny
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Item {
                        width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        height:  (model.index % 2 ? dummyText.height * 5 + paddingLarge : 0)
                        Rectangle {
                            width: 1
                            opacity: 0.6
                            color: "black"
                            y: paddingMedium
                            visible: model.index % 2
                            height: parent.height - y - paddingSmall
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Column {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width + unit - 2 * paddingSmall
                        Label {
                            text: model.food
                            width: parent.width
                            font.pixelSize: fontSizeTiny
                            horizontalAlignment: Text.AlignHCenter
                        }
                        Label {
                            opacity: 0.7
                            color: "darkred"
                            text: model.drinks
                            width: parent.width
                            font.pixelSize: fontSizeTiny
                            height: Math.max(2 * dummyText.height, implicitHeight)
                        }
                    }
                }

                model: ListModel {
                    ListElement {
                        day: "9"
                        weekday: "Ke"
                        food: "Glut. hampurilainen salaatilla, 10kpl wings"
                        drinks: "4 olutta"
                        level: -1
                    }
                    ListElement {
                        day: "10"
                        weekday: "To"
                        food: "Int. kana ja riisi, kalasushi, suklaakakun pala"
                        drinks: ""
                        level: 4
                    }
                    ListElement {
                        day: "11"
                        weekday: "Pe"
                        food: "Tomaattipasta, tortilloja suklaajäätelöä 2dl"
                        drinks: "2 lasia viiniä"
                        level: 1
                    }
                    ListElement {
                        day: "12"
                        weekday: "La"
                        food: "Maitorahkavälipala, soijawokki riisillä"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "13"
                        weekday: "Su"
                        food: "Soijawokki riisillä, kanapullia ja muusia"
                        drinks: "Glut. olut"
                        level: 2 // 4
                    }
                    ListElement {
                        day: "14"
                        weekday: "Ma"
                        food: "Lohisalaatti"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "15"
                        weekday: "Ti"
                        food: "Kanaa ja riisiä, tofua ja perunaa"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "16"
                        weekday: "Ke"
                        food: "Kanaa ja riisiä, kananmuna"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "17"
                        weekday: "To"
                        food: "Lohisalaatti, mozzarellatortillapizza"
                        drinks: ""
                        level: 1
                    }
                    ListElement {
                        day: "18"
                        weekday: "Pe"
                        food: "Lohisalaatti, seitä ja perunaa"
                        drinks: "2 olutta, toinen ei glut."
                        level: 2
                    }
                    ListElement {
                        day: "19"
                        weekday: "La"
                        food: "Glut. makaroni ja kalapihvejä, vehnätortilloja, suklaakakkua, pizzaa"
                        drinks: "2 lasia viiniä"
                        level: 3
                    }
                    ListElement {
                        day: "20"
                        weekday: "Su"
                        food: "Minidonitsi, glut. kanahampurilainen"
                        drinks: "Glut. olut"
                        level: 3
                    }
                    ListElement {
                        day: "21"
                        weekday: "Ma"
                        food: "Lohisalaatti"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "22"
                        weekday: "Ti"
                        food: "Lohisalaatti, tomaattikastike ja glut. makaroni"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "23"
                        weekday: "Ke"
                        food: "Glut. kasvishampurilainen"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "24"
                        weekday: "To"
                        food: "Halloumisalaatti, Tofua ja perunaa"
                        drinks: "2 lasia viiniä"
                        level: 1
                    }
                    ListElement {
                        day: "25"
                        weekday: "Pe"
                        food: "Glut. kanaleipä, lohisushia"
                        drinks: "2 olutta"
                        level: 2
                    }
                    ListElement {
                        day: "26"
                        weekday: "La"
                        food: "Kalapihvejä ja glut. makaronia, tortilloja"
                        drinks: "Glut. olut"
                        level: 3
                    }
                    ListElement {
                        day: "3"
                        weekday: "Su"
                        food: "Täytetty vehnäsämpylä, kanaa riisillä"
                        drinks: ""
                        level: -1
                    }
                    ListElement {
                        day: "4"
                        weekday: "Ma"
                        food: "Kanasalaatti, glut. tomaattipasta"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "5"
                        weekday: "Ti"
                        food: "?"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "6"
                        weekday: "Ke"
                        food: "Lohisushia, maitorahka ja marjoja"
                        drinks: ""
                        level: -1
                    }
                    ListElement {
                        day: "7"
                        weekday: "To"
                        food: "Kanaa riisillä, kanasalaatti"
                        drinks: ""
                        level: 3
                    }
                    ListElement {
                        day: "8"
                        weekday: "Pe"
                        food: "Sushi, glut. kanahampurilainen"
                        drinks: ""
                        level: 3
                    }
                    ListElement {
                        day: "9"
                        weekday: "La"
                        food: "Kanaa, riisiä, lohta, 3 pientä ribs, lohisushia"
                        drinks: "2 glut. olutta\nLasi viiniä"
                        level: 1
                    }
                    ListElement {
                        day: "10"
                        weekday: "Su"
                        food: "Kanaa ja nuudeleita"
                        drinks: "Lasi viiniä"
                        level: 1 // aamulla 0, illalla 2
                    }
                    ListElement {
                        day: "11"
                        weekday: "Ma"
                        food: "Katkaraputortilla, kasvispihvejä ja muusia"
                        drinks: ""
                        level: 1
                    }
                    ListElement {
                        day: "12"
                        weekday: "Ti"
                        food: "Lohisushi, kasvistortilloja, juustokakun pala"
                        drinks: "Glut. olut"
                        level: 2
                    }
                    ListElement {
                        day: "13"
                        weekday: "Ke"
                        food: "Lohisalaatti, glut. sämpylä, kananmuna"
                        drinks: ""
                        level: 1
                    }
                    ListElement {
                        day: "14"
                        weekday: "To"
                        food: "hernekeitto, pannukakku, glut. tonnikalapizza"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "15"
                        weekday: "Pe"
                        food: "Kanatortilla, glut. avokadopasta"
                        drinks: "2 glut. olutta\nLasi viiniä"
                        level: 3
                    }
                    ListElement {
                        day: "16"
                        weekday: "La"
                        food: "Glut. kalapizza, mansikkasmoothie"
                        drinks: "Olut"
                        level: 3
                    }
                    ListElement {
                        day: "17"
                        weekday: "Su"
                        food: "Glut. pasta, vihanneksia ja tofua, täytetyt kasvispaprikat, konvehteja"
                        drinks: ""
                        level: 3
                    }
                    ListElement {
                        day: "18"
                        weekday: "Ma"
                        food: "Lohisalaatti, glut. tomaattipasta"
                        drinks: ""
                        level: 2
                    }
                    ListElement {
                        day: "21"
                        weekday: "To"
                        food: "Kalaa ja riisiä, sisäfile ja perunoita"
                        drinks: "Lasi punaviiniä\n2 drinkkiä"
                        level: 1
                    }
                    ListElement {
                        day: "22"
                        weekday: "Pe"
                        food: "Lohisushia, kasvishampurilainen"
                        drinks: "2 olutta"
                        level: 3
                    }
                }
            }
        }
    }
}
