#include "nfclogentry.h"
#include <QDebug>

NfcLogEntry::NfcLogEntry(QObject *parent) :
    QObject(parent)
{
    storeDateTime();
    recordType = unknownRecordType;
    uid = "invalid";
    ndefMessage = QNdefMessage();
}

NfcLogEntry::NfcLogEntry(QString newUid, QUrl newUrl, QObject *parent)
{
    NfcLogEntry();
    this->setUid(newUid);
    this->setUrl(newUrl);
    qDebug() << uid;
}

void NfcLogEntry::storeDateTime()
{
    dateTime = QDateTime::currentDateTime();
}

void NfcLogEntry::setUid(QString readUid)
{
    uid = readUid;
}

void NfcLogEntry::setNDefMessage(QNdefMessage readNDefmessage)
{
    ndefMessage = readNDefmessage;
}

void NfcLogEntry::setUrl(QUrl newUrl)
{
    url = newUrl;
}

void NfcLogEntry::setAlias(QString newAlias)
{
    alias = newAlias;
}
