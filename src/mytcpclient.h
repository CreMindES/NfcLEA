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

    Q_INVOKABLE bool connectToServer(QString address, quint16 port);
    Q_INVOKABLE bool reConnectToServer();
    void sendNfcUid(QString uid);
    Q_INVOKABLE bool isClientConnected();
    Q_INVOKABLE QString getHostAddress();
    void setHostAddress(QString newHostAddress);
    Q_INVOKABLE quint16 getPortNumber();
    void setPortNumber(quint16 newPortNumber);
    Q_INVOKABLE void disconnect();
    
signals:
    void connectionStateChanged();
    
public slots:
    void onConnected();
    void onDisconnected();
    void onError();
    
private:
    QTcpSocket socket;
    QHostAddress socketHostAddress;
    quint16 socketPortNumber;

    bool connectTcpServer(QHostAddress hostAddress, quint16 port);
};

#endif // MYTCPCLIENT_H
