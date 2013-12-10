#include "applogentry.h"
#include <QList>

AppLogEntry::AppLogEntry(QObject *parent) :
    QObject(parent)
{
    nfcLogEntry = new NfcLogEntry();
    ruleLogEntry = new RuleLogEntry();
    text = "jeee";
}

AppLogEntry::AppLogEntry(NfcLogEntry *newNfcLogEntry)
{
    nfcLogEntry = newNfcLogEntry;
}

void AppLogEntry::createNfcLogEntry(QString uid, QUrl url)
{
    nfcLogEntry->setUid(uid);
    nfcLogEntry->setUrl(url);
    logEntryType = nfcTypeLogEntry;
    emit nfc_uidChanged();
}
