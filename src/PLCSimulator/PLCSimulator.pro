TEMPLATE = app

include(../plc-gnosis-common.pri)
include(../plc-ns3-common.pri)

#Setup destination for binaries and temp files
DESTDIR = $$BIN_DIRECTORY/app

#Configuration specific settings
CONFIG(debug, release|debug) {
    TARGET = simulator
    OBJECTS_DIR =   $$BIN_DIRECTORY/tmp/obj/debug
    MOC_DIR =       $$BIN_DIRECTORY/tmp/moc/debug
}
else {
    TARGET = simulator
    OBJECTS_DIR =   $$BIN_DIRECTORY/tmp/obj/release
    MOC_DIR =       $$BIN_DIRECTORY/tmp/moc/release
}

INCLUDEPATH +=  $$NS3_DIR
LIBS += -L$$NS3_DIR $$NS3_LIBRARIES

LIBS += -L$$BIN_DIRECTORY/app
LIBS  += -lplctopologyloader

#Source files
HEADERS +=  src/Simulator/simulator.h \
            ../../lib/QCustomPlot/qcustomplot.h \
            src/BodeWidget/bodewidget.h \
            src/SimulatorMainWindow/simulatormainwindow.h

SOURCES +=  src/Simulator/simulator.cpp \
            src/Simulator/simulatorMain.cpp \
            ../../lib/QCustomPlot/qcustomplot.cpp \
            src/BodeWidget/bodewidget.cpp \
            src/SimulatorMainWindow/simulatormainwindow.cpp
