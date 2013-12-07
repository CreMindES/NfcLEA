#include "nfclogentry.h"

NfcLogEntry::NfcLogEntry(QObject *parent) :
    QObject(parent)
{
    storeDateTime();
    uid = "invalid";
    ndefMessage = QNdefMessage();
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

void NfcLogEntry::setAlias(QString newAlias)
{
    alias = newAlias;
}
