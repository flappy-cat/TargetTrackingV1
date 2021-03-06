QT += core network serialport
QT -= gui

TARGET = TargetTrackingGPU
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    globalsettings.cpp \
    serialPortService/dataparser4payload.cpp \
    serialPortService/dataparserbase.cpp \
    serialPortService/serviceserialpayload.cpp \
    udpService/managerofcommunicaion.cpp \
    udpService/serviceudpvideo.cpp \
    datamanager.cpp \
    videoProcService/videoencodeh264.cpp \
    udpService/udpsendservice.cpp \
    serialPortService/serviceserialfirectrl.cpp \
    serialPortService/dataparser4firectrl.cpp \
    videoProcService/trackalgorithm.cpp \
    log4cat.cpp

HEADERS += \
    globalsettings.h \
    serialPortService/dataparser4payload.h \
    serialPortService/dataparserbase.h \
    serialPortService/serviceserialpayload.h \
    udpService/managerofcommunicaion.h \
    udpService/serviceudpvideo.h \
    datamanager.h \
    videoProcService/videoencodeh264.h \
    udpService/udpsendservice.h \
    serialPortService/serviceserialfirectrl.h \
    serialPortService/dataparser4firectrl.h \
    videoProcService/trackalgorithm.h \
    log4cat.h

INCLUDEPATH += ./serialPortService ./udpService ./videoProcService ./algorithm/include

INCLUDEPATH += /usr/local/include/opencv310 /usr/local/include/ffmpeg \
                /usr/include/log4cplus

LIBS += -L/usr/local/lib/opencv310 -lopencv_core -lopencv_imgproc   -lopencv_videoio \
    -lopencv_highgui  -lopencv_video  -lopencv_features2d -lopencv_calib3d  -lopencv_imgcodecs \
    -lopencv_shape -lopencv_cudaobjdetect -lopencv_cudawarping -lopencv_cudaimgproc
LIBS += -L/usr/local/lib -lavcodec-ffmpeg -lavutil-ffmpeg
LIBS += -L../algorithm/lib -lcvFeatureExtractMatch -lKCFTracker -lCalibrateInformationMeasure
LIBS += -L/usr/lib/aarch64-linux-gnu/ -llog4cplus

OBJECTS_DIR += ./temp
MOC_DIR += ./temp
