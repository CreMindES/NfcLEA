#include "app.h"
#include <QDebug>

App::App(QObject *parent) :
    QObject(parent)
{
    //appLogger = new AppLogger(this);
    ndefManager = new NdefManager(this);

    // Creating Signal & Slot connections
    connect(ndefManager, SIGNAL(nfcTagUriRecordRead(QString,QUrl)),
            this,   SLOT(onNfcTagUriRecordRead(QString,QUrl)));
}

void App::onNfcTagUriRecordRead(QString uid, QUrl url)
{
    qDebug() << "hee: " << uid;
    // template method for later enhancement
    NfcLogEntry *newNfcLogEntry = new NfcLogEntry(uid, url);
    AppLogEntry *newAppLogEntry = new AppLogEntry(newNfcLogEntry);
    appLogger.addAppLog(AppLogEntry::nfcTypeLogEntry, newAppLogEntry);
    //appLogger->appLog->append(nfcLogEntry);
    qDebug() << "UID:" << ((AppLogEntry*)appLogger.appLog.at(2))->getNfcLogEntry()->getUid();
    qDebug() << "URL:" << ((AppLogEntry*)appLogger.appLog.at(2))->getNfcLogEntry()->getUrl();
}
