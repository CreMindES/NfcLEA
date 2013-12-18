#include <QDebug>

#include "app.h"

App::App(QObject *parent) :
    QObject(parent)
{
    appSettings = new QSettings("nfcLEA", "nfcLEA", this);
    ndefManager = new NdefManager(this);
    client = new MyTcpClient;

    loadSettings();
    client->connectToServer(client->getHostAddress(), client->getPortNumber());

    // Creating Signal & Slot connections
    connect(ndefManager, SIGNAL(nfcTagUriRecordRead(QString,QUrl)),
            this,        SLOT(onNfcTagUriRecordRead(QString,QUrl)));
}

App::~App()
{
    saveSettings();
}

void App::onNfcTagUriRecordRead(QString uid, QUrl url)
{
//    qDebug() << "App: UID is " << uid;

    // Logging NFC tag reads
    NfcLogEntry *newNfcLogEntry = new NfcLogEntry(uid, url);
    AppLogEntry *newAppLogEntry = new AppLogEntry(newNfcLogEntry);
    appLogModel.addLogEntry(newAppLogEntry);

    // Sending uid to the server
    client->sendNfcUid(uid);
}

void App::loadSettings()
{
    appSettings->beginGroup("Network");

    client->setHostAddress(appSettings->value("HostAddress", "").toString());
    client->setPortNumber(appSettings->value("PortNumber", 8080).toUInt());

    appSettings->endGroup();
}

void App::saveSettings()
{
    appSettings->beginGroup("Network");

    appSettings->setValue("HostAddress", QVariant::fromValue(client->getHostAddress()));
    appSettings->setValue("PortNumber", QVariant::fromValue(client->getPortNumber()));

    appSettings->endArray();
}
