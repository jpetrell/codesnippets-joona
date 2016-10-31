import QtQuick 2.0
import "components"

Item {
    width: 800
    height: grid.height + 4*unit

    function percentage(population) {
        return Math.round(100*population/worldPopulation) + "%"
    }

    property int unit: width/60
    property int fontSizeMedium: width/50
    property int fontSizeLarge: fontSizeMedium*1.6
    property color primaryColor: "black"
    property int worldPopulation: 7461
    property var scripts: [
        {
            "script": "Latin",
            "places": "Western Europe, Americas, Africa",
            "population": 4900,
            "fontFamily": "Source Sans Pro",
            "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "enlarge": true
        },
        {
            // Simplified Chinese: China, Singapore
            // Traditional Chinese: Hong Kong, Taiwan, Malaysia
            "script": "Chinese",
            "places": "China, Southeast Asia",
            "population": 1340,
            "fontFamily": "WenQuanYi",
            "text": "在另一方面，我们谴责与义愤和不喜欢的人谁是如此引诱，士气低落的时刻愉悦的魅力，被欲望蒙蔽这样，他们无法预见的痛苦。"
        },
        {
            "script": "Devanagari",
            "places": "India",
            "population": 420, // Devanagari 420, other Indian scripts 910
            "fontFamily": "Lohit Devanagari",
            "text": "दूसरी ओर, हम तो वे दर्द और पीछा करने के लिए बाध्य कर रहे हैं कि मुसीबत उम्मीद नहीं कर सकते कि, इतनी इच्छा से अंधे, पल की खुशी का आकर्षण द्वारा और हतोत्साहित कर रहे हैं"
        },
        {
            "script": "Arabic",
            "places": "Middle east, North Africa",
            "population": 660,
            "fontFamily": "Amiri",
            "text": "غير ألمانيا ليتسنّى وبولندا ثم. تصرّف الإثنان تم حتى, اليميني المتحدة عل ذات. أن شدّت لليابان اقتصادية أخذ, كان أثره، وعُرفت وإعلان إذ. وحتى بالرّغم بها ما, حيث إذ تمهيد بقسوة."
        },
        {
            "script": "Other Indic scripts"
        },
        {
            "script": "Cyrillic",
            "places": "Russia, Eastern Europe",
            "population": 250,
            "fontFamily": "Source Sans Pro",
            "text": "Лорем ипсум долор сит амет, ин нулла сцаевола вих, не про еверти сусципиантур, демоцритум персеяуерис ад мел. "
        },
        {
            "script": "Japanese",
            "places": "Japan",
            "population": 120,
            "text": "ちのめんょ露巣そきみ、氏保、課御絵無え。日やらててあっおちてぬひた課屋派ょノセンレヘ巣屋にのと。"
        },
        {
            "script": "Korean",
            "places": "North and South Korea",
            "population": 79,
            "text": "대한민국의 경제질서는 개인과 기업의 경제상의 자유와 창의를 존중함을 기본으로 한다. 직전대통령이 없을 때에는 대통령이 지명한다. 공무원은 국민전체에 대한 봉사자이며."
        },

        /*{
            "script": "Thai",
            "places": "Thailand",
            "population": 38,
            "text": "เป็นข้อความแทนที่ใช้เพื่อลดความสนใจต่อข้อความที่นำมาแสดง สำหรับการแสดงลักษณะของ ฟอนต์ การพิมพ์และการจัดหน้า"
        }*/
    ]

    Grid {
        id: grid

        y: 2*unit
        x: unit
        columns: 2
        width: parent.width - 2*x
        spacing: 2*unit
        Repeater {
            /*
            - Simplified world map  https://commons.wikimedia.org/wiki/Category:Blank_SVG_maps_of_the_world#/media/File:World_map_-_low_resolution.svg
            - World map: http://www.worldstandards.eu/WordPress/wp-content/uploads/alphabets-spread-around-the-world-1024x645.jpg
            - Population https://en.wikipedia.org/wiki/List_of_writing_systems#List_of_writing_scripts_by_adoption
            - SVG renderer where you can pick values to bound to
            */

            model: scripts
            Paragraph {
                id: paragraph
                title: modelData.script + " " + (modelData.population ? percentage(modelData.population) : "")
                description: modelData.text
                enlarge: modelData.script == "Latin"
                Component.onCompleted: {
                    if (modelData.script == "Other Indic scripts") {
                        description = ""
                        indicScriptsLabel.parent = paragraph
                        height = indicScriptsLabel.height
                    }
                }

            }
        }
    }
    Text {
        id: indicScriptsLabel
        width: parent.width
        text: "Bengali " + percentage(220) + ", Gurmukhi " + percentage(100) + ", Telegu " + percentage(74) + ", Tamil " + percentage(70) + ", Malayalam " + percentage(62) + ", etc."
        font.family: "Source Sans Pro"
        font.weight: Font.Light
        font.pixelSize: fontSizeLarge/1.2
        wrapMode: Text.Wrap
        color: primaryColor
    }
}

