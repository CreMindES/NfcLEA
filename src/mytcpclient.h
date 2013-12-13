#ifndef MYTCPCLIENT_H
#define MYTCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QHostAddress>

#include <QDebug>

class MyTcpClient : public QObject
{
    Q_OBJECT
public:
    explicit MyTcpClient(QObject *parent = 0);
    ~MyTcpClient();

    bool connectToServer(QString addess, quint16 port);
    bool reConnectToServer();
    void sendNfcUid(QString uid);
    
signals:

    
public slots:
    void onConnected();
    void onDisconnected();
    
private:
    QTcpSocket socket;
    QHostAddress socketHostAddress;
    quint16 socketPort;

    bool connectTcpServer(QHostAddress hostAddress, quint16 port);
};

#endif // MYTCPCLIENT_H
