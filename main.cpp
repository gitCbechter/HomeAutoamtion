/********************************************************************
 * file:  main.cpp
 * brief: main file of the project
 * info:  None
 ********************************************************************/
#include <QGuiApplication>
#include <QtGui>
#include <QtWidgets/QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "homebridge.h"
#include "weatherbridge.h"
#include "ctrlbridge.h"
#include "datamonitorlog.h"
#include "model.h"
#include "statusbridge.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //QGuiApplication app(argc, argv); -> cause of bug at QtChart!
    //use QApplication to overcome a bug instead of QGuiApplication
    QApplication app(argc,argv,0);
    QQmlApplicationEngine engine;
    //creation of the objects
    //theModel object is injected to all the other objects
    Model theModel;
    HomeBridge homebridge(nullptr, &theModel);
    WeatherBridge weatherbridge(nullptr, &theModel);
    CtrlBridge ctrlbridge(nullptr, &theModel);
    DataMonitorLog datamonitorlog(nullptr, &theModel);
    StatusBridge statusbridge(nullptr, &theModel);
    //QML and CPP interconnections
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("homebridge", &homebridge);
    context->setContextProperty("weatherbridge", &weatherbridge);
    context->setContextProperty("ctrlbridge", &ctrlbridge);
    context->setContextProperty("datamonitorlog", &datamonitorlog);
    context->setContextProperty("statusbridge", &statusbridge);
    //start the main.qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
