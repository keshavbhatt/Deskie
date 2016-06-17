#ifndef DOWNLOADER_H
#define DOWNLOADER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QString>
#include <QImage>
#include <QQuickPaintedItem>
#include <QFileInfoList>

class Downloader : public QObject
{
    Q_OBJECT




public:
    explicit Downloader(QObject *parent = 0);
    ~Downloader();
    Q_INVOKABLE void openOfflineDir();
    Q_INVOKABLE void openWebsite();
    Q_INVOKABLE void nextrandWall();
    Q_INVOKABLE void nextWall();
    Q_INVOKABLE  void prevWall();
    Q_INVOKABLE void slidShow();
    Q_INVOKABLE void social(const QString &);
    Q_INVOKABLE void getPlayStore();
    Q_INVOKABLE void setOfflineDir();
    Q_INVOKABLE void downloadUrl(const QString &);
    Q_INVOKABLE void check_file(const QString &);
    Q_INVOKABLE void change_picture_option(const QString &);
    Q_INVOKABLE void imageurl(const QString &);


signals:
    void progress(qint64, qint64);
    void speed(qint64);
    void finished();
    void download_startedd();
    void file_existss();
    void file_not_existss();
    void downloadError(QNetworkReply::NetworkError);
    void downloadF(QString );


private:
    quint64 m_bytes_available_tally;
    QNetworkAccessManager m_network_manager;
    QNetworkReply *m_network_reply;
    QFile *m_file;
    QFileInfoList  list;

public slots:
      void downloadCancel();
      void listImages();
      static void damn();
      static void damn1();
      static void damn2();

private slots:
//      void downlaodfolder(QString);
    void downloadProgress(qint64, qint64);
    void downloadFinished();
    void downloadReadyRead();
    void error(QNetworkReply::NetworkError);


};

#endif // DOWNLOADER_H
