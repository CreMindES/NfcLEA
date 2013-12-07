#include "applogentry.h"

AppLogEntry::AppLogEntry(QObject *parent) :
    QObject(parent)
{
    nfcLogEntry = new NfcLogEntry(this);
    ruleLogEntry = new RuleLogEntry(this);
}

void AppLogEntry::addNfcLogEntry(NfcLogEntry newNfcLogEntry, QString uid, QNdefMessage message,
                                 QString alias)
{
    //nfcLogEntry
}
