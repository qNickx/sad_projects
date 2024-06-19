QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    dialogauthor.cpp \
    dialogrowedit.cpp \
    dialogselectaction.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    dialogauthor.h \
    dialogrowedit.h \
    dialogselectaction.h \
    mainwindow.h

FORMS += \
    dialogauthor.ui \
    dialogrowedit.ui \
    dialogselectaction.ui \
    mainwindow.ui

TRANSLATIONS += tr/Cursovaya_3kurs_ru_RU.ts \
                tr/Cursovaya_3kurs_de_DE.ts \
                tr/Cursovaya_3kurs_en_US.ts

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
