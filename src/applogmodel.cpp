#include "applogmodel.h"

AppLogModel::AppLogModel(QObject *parent)
{
    QHash<int, QByteArray> roles;
    roles[LogTypeRole]      = "logEntryType";
    roles[TimeElapsedRole]  = "timeElapsed";
    roles[NfcUidRole]       = "nfcUid";
    roles[NfcUrlRole]       = "nfcUrl";
    setRoleNames(roles);
}

AppLogModel::~AppLogModel()
{
}

void AppLogModel::addLogEntry(AppLogEntry *newLogEntry)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_appLog.append(newLogEntry);
    endInsertRows();
    emit rowCountChanged();
}

void AppLogModel::addLogEntry(NfcLogEntry *newNfcLogEntry)
{
    AppLogEntry *newLogEntry = new AppLogEntry(newNfcLogEntry);
    addLogEntry(newLogEntry);
}

int AppLogModel::rowCount(const QModelIndex &parent) const
{
    return m_appLog.count();
}

QVariant AppLogModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() > m_appLog.count())
        return QVariant();

    AppLogEntry *logEntry = m_appLog[index.row()];
    if(role == LogTypeRole) {
        return logEntry->logEntryType();
    }
    if(role == TimeElapsedRole) {
        /*
        // TODO: add nicer formatting
        QDateTime timeElapsed = QDateTime::currentDateTime() - logEntry->logTime();
        return timeElapsed.toString("yyyy.mm.dd hh.mm");
        */
        return logEntry->logTime().toString("yyyy.mm.dd hh.mm");
    }
    if(role == NfcUidRole) {
        return logEntry->nfcLogEntry->getUid();
    }
    if(role == NfcUrlRole) {
        return logEntry->nfcLogEntry->getUrl();
    }
}

void AppLogModel::clearHistory()
{
    this->beginResetModel();
    m_appLog.clear();
    this->endResetModel();
    qDebug() << "AppLogModel: History deleted.";
}

