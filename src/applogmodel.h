#ifndef APPLOGMODEL_H
#define APPLOGMODEL_H

#include <QAbstractListModel>
#include <QDebug>

#include "applogentry.h"
#include "nfclogentry.h"
#include "rulelogentry.h"

class AppLogModel : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(int count READ rowCount NOTIFY rowCountChanged)

public:
    AppLogModel(QObject* parent = 0);
    ~AppLogModel();

    void addLogEntry(AppLogEntry *newLogEntry);
    void addLogEntry(NfcLogEntry *newNfcLogEntry);
    //void addLogEntry(RuleLogEntry newRuleLogEntry);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    enum AnimalRoles {
        LogTypeRole = Qt::UserRole + 1,
        TimeElapsedRole,
        NfcUidRole,
        NfcUrlRole
    };

private:
    QList<AppLogEntry*> m_appLog;

signals:
    void rowCountChanged();

public slots:
    void clearHistory();
};

#endif // APPLOGMODEL_H
