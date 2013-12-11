#include "applogentry.h"

AppLogEntry::AppLogEntry(QObject *parent) :
    QObject(parent)
{
    nfcLogEntry = new NfcLogEntry();
    ruleLogEntry = new RuleLogEntry();
}

AppLogEntry::AppLogEntry(NfcLogEntry *newNfcLogEntry)
{
    dateTime = QDateTime::currentDateTime();
    nfcLogEntry = newNfcLogEntry;
    m_logEntryType = nfcTypeLogEntry;
}

void AppLogEntry::createNfcLogEntry(QString uid, QUrl url)
{
    nfcLogEntry->setUid(uid);
    nfcLogEntry->setUrl(url);
//    m_logEntryType = nfcTypeLogEntry;
}
