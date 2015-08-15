TEMPLATE = aux

PROJECTS = button colorstrips fallingcubes \
    horizontalflow livepixels \
    overlappingletters splash timepicker \
    views

message($${PROJECTS})
OTHER_FILES += *.qml *.js
for (PROJECT, PROJECTS) {
    OTHER_FILES += $${PROJECT}/*.qml \
                   $${PROJECT}/*.js \
                   $${PROJECT}/components/*.qml \
                   $${PROJECT}/components/*.js
}
