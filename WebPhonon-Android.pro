TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc \
    icons.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    application-exit.png \
    document-open.png \
    media-playback-pause.png \
    media-playback-start.png \
    media-playback-stop.png \
    media-skip-backward.png \
    media-skip-forward.png
