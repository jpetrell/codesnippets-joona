TEMPLATE = aux

PROJECTS = button colorstrips fallingcubes geometry scripts \
           horizontalflow layoutgrid layouts livepixels navigation \
           overlappingletters scalability splash timepicker trees \
           view views

message($${PROJECTS})
OTHER_FILES += *.qml *.js
for (PROJECT, PROJECTS) {
    OTHER_FILES += $${PROJECT}/*.qml \
                   $${PROJECT}/*.js \
                   $${PROJECT}/components/*.qml \
                   $${PROJECT}/components/*.js
}
