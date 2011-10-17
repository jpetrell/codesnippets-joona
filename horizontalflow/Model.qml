import QtQuick 1.0

ListModel {
    property variant alphabets: []
    property variant alphabetIndeces: []
    function calculateAlphabets() {
        var newAlphabets = []
        var newAlphabetIndeces = []
        var previousItem, item = " "
        for (var index = 0; index < count; index++) {
            previousItem = item
            item = get(index).item
            if (previousItem.charAt(0) != item.charAt(0)) {
                newAlphabets[newAlphabets.length] = item.charAt(0)
                newAlphabetIndeces[newAlphabetIndeces.length] = index
            }
        }
        alphabets = newAlphabets
        alphabetIndeces = newAlphabetIndeces
    }
    Component.onCompleted: populate()
    function populate() {
        // go from A to Z
        for (var index = 65; index < 91; index++) {
            var alphabet = String.fromCharCode(index)
            var alphabetCount = Math.floor(Math.random()*5)
            for (var index2 = 0; index2 < alphabetCount; index2++)
                append({"number": count, "item": alphabet})
        }
        calculateAlphabets()
    }
}
