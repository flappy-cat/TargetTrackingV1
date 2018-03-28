#include <QCoreApplication>
#include "globalsettings.h"
#include "serviceudpvideo.h"
#include "serviceserialpayload.h"
#include "managerofcommunicaion.h"
//#include "servicevideoproc.h"
#include "serviceserialfirectrl.h"
#include "log4cat.h"
#include "videoencodeh264.h"
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    VideoEncodeH264 enc;
    Log4Cat * pLog = Log4Cat::getInstance ();
    pLog->InitLog ("/home/nvidia/appsettings/log4cplus.properties");

    EASYLOG("APPlication Start========================================================");
    qDebug()<<"Starting Initialize Global Serttings\n";
//1-Initialize the Global Settings====================================
    GlobalSettings* pInstance = GlobalSettings::getInstance ();
    pInstance->initSettings ();

//===============Get the singleton=============================================
    ManagerOfCommunicaion* pManager = ManagerOfCommunicaion::getInstance ();
    ServiceSerialPayload* pSerialServicePayload = ServiceSerialPayload::getInstance ();
    ServiceSerialFireCtrl* pSerialServiceFireCtrl = ServiceSerialFireCtrl::getInstance ();
    //ServiceVideoProc* pVideoProcService = ServiceVideoProc::getInstance ();

//2-Start the UDP Service==============================================
      pManager->StartCommunication ();
//3-Start the SerialPort Service=========================================
      pSerialServicePayload->StartService ();
      pSerialServiceFireCtrl->StartService ();

    qDebug()<<"Starting VideoProc Serivce\n";
//4-Start VideoCapture===================

    //pVideoProcService->StartService ();

    //enc.StartEncodeLoop ();


    EASYLOG("APPlication end========================================================");
    return a.exec();

}

