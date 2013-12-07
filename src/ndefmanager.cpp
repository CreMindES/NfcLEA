#include <qdeclarative.h>
#include <QDeclarativeComponent>
#include <QDeclarativeEngine>

#include "ndefmanager.h"

NdefManager::NdefManager(QObject *parent) :
    QObject(parent)
{
    // NdefManager (this) is the parent; will automatically delete nfcManager
    nfcManager = new QNearFieldManager(this);
    nfcManager->setTargetAccessModes(QNearFieldManager::NdefReadTargetAccess);

    //React only to Uri records (NfcRtd, "U")
    //QNdefFilter filter;
    //filter.appendRecord<QNdefNfcUriRecord>();
    //nfcManager->registerNdefMessageHandler(filter, this, SLOT(targetDetected(QNdefMessage, QNearFieldTarget*)));
    //filter.appendRecord(QNdefRecord::NfcRtd, "U");
    //nfcManager->registerNdefMessageHandler(QNdefRecord::NfcRtd, "U", this, SLOT(targetDetected2(QNdefMessage, QNearFieldTarget)));

    connect(nfcManager, SIGNAL(targetDetected(QNearFieldTarget*)), this, SLOT(targetDetected2(QNearFieldTarget*)));
    connect(nfcManager, SIGNAL(targetLost(QNearFieldTarget*)), this, SLOT(targetLost(QNearFieldTarget*)));

    isNfcAvailabe = true; // for qml
    isNfcAvailabe = nfcManager->isAvailable();
    if(isNfcAvailabe) {
        nfcManager->startTargetDetection();
        qDebug() << "NFC is available.\nNFC tag dectection has started...";
    }
    else {
        qDebug() << "NFC is not availabe!!!";
    }
}

void NdefManager::targetDetected2(QNearFieldTarget *target)
{
    qDebug() << "Target detected.";
    currentUID = QString(target->uid().toHex());
    emit tagDetected(currentUID);

    connect(target, SIGNAL(ndefMessageRead(QNdefMessage)), this, SLOT(readRecord(QNdefMessage)));
    target->readNdefMessages();
}

void NdefManager::readRecord(QNdefMessage message)
{
//    QByteArray result;

    //QNdefRecord record = message.at(0);   // using the first entry

    foreach (const QNdefRecord &record, message) {
        // Check type again, just to make sure
        if (record.isRecordType<QNdefNfcUriRecord>()) {
            // Convert to the specialized URI record class
            QNdefNfcUriRecord uriRecord(record);
            // Emit a signal with the URI
            emit nfcReadTagUri(uriRecord.uri());
        }
    }

    //qDebug() << "readRecord:\n" << record.type();
}

void NdefManager::targetDetected(const QNdefMessage &message, QNearFieldTarget *target)
{
    qDebug() << "Uri target detected.";
    currentUID = QString(target->uid().toHex());
    emit tagDetected(currentUID);

    //connect(target, SIGNAL(ndefMessageRead(QNdefMessage)), this, SLOT(readRecord(QNdefMessage)));
    //target->readNdefMessages();

    foreach (const QNdefRecord &record, message) {
        // Check type again, just to make sure
        if (record.isRecordType<QNdefNfcUriRecord>()) {
            // Convert to the specialized URI record class
            QNdefNfcUriRecord uriRecord(record);
            // Emit a signal with the URI
            emit nfcReadTagUri(uriRecord.uri());
        }
    }


}

void NdefManager::targetLost(QNearFieldTarget *target)
{
    target->deleteLater();
    qDebug() << "Target lost.";
    emit tagLost();
}
