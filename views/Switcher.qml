import QtQuick 2.2
import "components"

Page {
    id: page
    clip: true

    Column {
        property int count: 5
        width: parent.width
        y: small

        Repeater {
            model: parent.count

            Item {
                width: parent.width
                height: large * scale
                scale: 0.5 + 0.5*(model.index/(parent.count-1))

                ContentItem {
                    x: medium
                    width: parent.width - 2*x
                    height: page.height - 2*large

                    Panel {
                        height: medium
                    }
                }
            }
        }
    }
}
