#include <QDebug>

#include "app.h"

App::App(QObject *parent) :
    QObject(parent)
{
    ndefManager = new NdefManager(this);

    // Creating Signal & Slot connections
    connect(ndefManager, SIGNAL(nfcTagUriRecordRead(QString,QUrl)),
            this,        SLOT(onNfcTagUriRecordRead(QString,QUrl)));
}

void App::onNfcTagUriRecordRead(QString uid, QUrl url)
{

//    qDebug() << "App: UID is " << uid;

    // Logging NFC tag reads
    NfcLogEntry *newNfcLogEntry = new NfcLogEntry(uid, url);
    AppLogEntry *newAppLogEntry = new AppLogEntry(newNfcLogEntry);
    appLogModel.addLogEntry(newAppLogEntry);
}
