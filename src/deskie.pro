TEMPLATE = app

QT += qml quick widgets svg

SOURCES += main.cpp \
    downloader.cpp

RESOURCES += qml.qrc \
    images.qrc \
    icons.qrc

include(deployment.pri)

QML_IMPORT_PATH += $$OUT_PWD/

HEADERS += \
    downloader.h


INCLUDEPATH += /usr/include/libappindicator-0.1 \
        /usr/include/gtk-2.0 \
        /usr/lib/gtk-2.0/include \
        /usr/include/glib-2.0 \
        /usr/lib/glib-2.0/include \
        /usr/include/cairo \
        /usr/include/atk-1.0 \
        /usr/include/pango-1.0

LIBS += -L/usr/lib -lappindicator -lnotify

CONFIG += link_pkgconfig

PKGCONFIG = gtk+-2.0
