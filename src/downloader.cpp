#include "downloader.h"
#include <QFileInfo>
#include <QDateTime>
#include <stdexcept>
#include <QStringList>
#include <QDesktopServices>
#include <QStandardPaths>
#include <QProcess>
#include <QTimer>
#include <QDir>


 int current=0;
 int now;

Downloader::Downloader(QObject *parent) : QObject(parent)
{
    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";
    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);
  m_bytes_available_tally = 0;
  listImages();
}

void Downloader::openOfflineDir(){
    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";
    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);

        QDesktopServices::openUrl(addin_path);
}



void Downloader::openWebsite(){
    QString website= "http://ktechpit.com" ;
    QDesktopServices::openUrl(website);
}


//random wallpaer
void Downloader::nextrandWall(){
    int low = 1;

    int  highl = list.size()-1;

    int rand =  qrand() % ((highl + 1) - low) + low;

    QString   program = "gsettings";
    QStringList args;
    args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<"file://"+list.at(rand).filePath() ;
    QProcess *myProcess = new QProcess(0);
    myProcess->start(program, args);
    myProcess->waitForFinished();

}


//next wallpaper
void Downloader::nextWall(){

    //qDebug()<<now << "staring of n";

 int high = list.size()-1;
 //qDebug()<<"high val n"<<high;

 if (now==high||now>=high){
     current= 0;
}

   now = ++current;

   //qDebug()<<now << "ending of n";

    QString   program = "gsettings";
    QStringList args;
    args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<"file://"+list.at(now).filePath() ;
    QProcess *myProcess = new QProcess(0);
    myProcess->start(program, args);
    myProcess->waitForFinished();
    if (now==high){
        current= 0;
   }

}
//prev wallpaper
void Downloader::prevWall(){


    //qDebug()<<now << "staring of p";
  int  high = list.size()-1;

    if (now==1){
        current= 1;
    }
    else if (now==0){
       current= high+1;
    }
    else if (now<=1){
       current= high+1;
    }


    now = --current;



   //qDebug()<<now << "ending of p";

    QString   program = "gsettings";
    QStringList args;
    args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<"file://"+list.at(now).filePath() ;
    QProcess *myProcess = new QProcess(0);
    myProcess->start(program, args);
    myProcess->waitForFinished();
    if (now==1){
        current= high+1;
    }
}


//slide show
void Downloader::slidShow(){

    int low = 1;

    int  high = list.size()-1;

    int rand =  qrand() % ((high + 1) - low) + low;

    QString   program = "gsettings";
    QStringList args;
    args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<"file://"+list.at(rand).filePath() ;
    QProcess *myProcess = new QProcess(0);
    myProcess->start(program, args);
    myProcess->waitForFinished();

    myProcess->deleteLater();
}




void Downloader::listImages(){
    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";

    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);

    dir.setFilter(QDir::NoDot|QDir::Files|QDir::NoDotAndDotDot|QDir::Readable|QDir::NoSymLinks);
    dir.setSorting(QDir::Time) ;


    list = dir.entryInfoList(QDir::Files);
    for (int i = 0; i < list.size(); i++)
    {
//        qDebug() << "Filename " + QString::number(i) + " = " + list.at(i).filePath();

    }
}


void Downloader::social(const QString &social){
    if(social=="f"){
        QString f="https://www.facebook.com/keshav.bhatt.393";
        QDesktopServices::openUrl(f);
    }else if(social=="t"){
         QString t="https://twitter.com/keshavmail68";
        QDesktopServices::openUrl(t);
    }
    else if(social=="g"){
         QString g="https://plus.google.com/105800765618056357846";
        QDesktopServices::openUrl(g);
    }
}

void Downloader::getPlayStore(){
    QString website= "http://www.ktechpit.com/ubuntu/ktechpit-com-released-ubuntu-play-store-ubuntu-16-04/" ;
    QDesktopServices::openUrl(website);
}



void Downloader::setOfflineDir(){
    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";
    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);
    emit downloadF(addin_path);
}

void Downloader::downloadUrl(const QString &link){

    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";
    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);


    //Logic if file is not in cache download it , if it exists then apply wallpaper , do not download it again

    QUrl url(link);
     QString filename = QFileInfo(url.path()).fileName();
     QFileInfo file(addin_path+"/"+filename);
     if(file.exists()){
         emit file_existss();

         QString   program = "gsettings";
         QStringList args;
         args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<"file://"+addin_path+"/"+filename;
         QProcess *myProcess = new QProcess(0);
         myProcess->start(program, args);
         myProcess->waitForFinished();



     }
     else{
emit downloadF(addin_path);
         emit download_startedd();
          QNetworkRequest request(url);

     m_file =  new QFile(addin_path+"/"+filename ); //addin_path

     m_network_reply = m_network_manager.get(request);


     // connect handlers (signals)
     connect(m_network_reply, SIGNAL(downloadProgress(qint64,qint64)), SLOT(downloadProgress(qint64,qint64)));
     connect(m_network_reply, SIGNAL(finished()), SLOT(downloadFinished()));
     connect(m_network_reply, SIGNAL(readyRead()), SLOT(downloadReadyRead()));
     connect(m_network_reply, SIGNAL(error(QNetworkReply::NetworkError)), SLOT(error(QNetworkReply::NetworkError)));

     // //qDebug() << "Downloading " << filename << " ...";



     if(!m_file->open(QIODevice::ReadWrite | QIODevice::Truncate)){
//         //qDebug() << m_file->errorString();
         throw std::runtime_error("Could not open a file to write.");
     }
     }

}

void Downloader::check_file(const QString &link){
    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";
    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);

    //Logic if file is not in cache download it , if it exists then apply wallpaper , do not download it again

    QUrl url(link);
    QString filename = QFileInfo(url.path()).fileName();
     QFileInfo file(addin_path+"/"+filename);
     if(file.exists()){
         emit file_existss();
     }
     else{
         emit file_not_existss();
     }
}


//setwallaper from offline source
void Downloader::imageurl(const QString &link){
    QString addin_path = QStandardPaths::writableLocation(QStandardPaths::DataLocation)+"/data";
    QDir dir(addin_path);
    if (!dir.exists())
        dir.mkpath(addin_path);
    QString program;


    program = "gsettings";
    QStringList args;
    args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<link;
    QProcess *myProcess = new QProcess(0);
    myProcess->start(program, args);
    myProcess->waitForFinished();
//    //qDebug()<<args;

}






void Downloader::downloadProgress(qint64 pos, qint64 total){
    emit progress(pos, total);
}




void Downloader::downloadCancel(){
    QFile file(m_file->fileName());
    file.remove();
    m_network_reply->abort();

}

void Downloader::downloadFinished(){
    m_bytes_available_tally = 0;

    if(m_network_reply->error() == QNetworkReply::NoError){

//        //qDebug() << "Finished downloading.";
        QString program;
        program = "gsettings";
        QStringList args;
        args<<"set"<<"org.gnome.desktop.background"<<"picture-uri"<<"file://"+m_file->fileName();
////qDebug()<<args;
        QProcess *myProcess = new QProcess(0);
        myProcess->start(program, args);
        myProcess->waitForFinished();


        m_file->close();

        listImages();

        emit finished();

        m_bytes_available_tally = 0;
    }
    else{
    QFile file(m_file->fileName());
    file.remove();}

    emit downloadError(m_network_reply->error());

}

void Downloader::downloadReadyRead(){
    if(m_network_reply->error() == QNetworkReply::NoError){
        static quint64 last_ms = QDateTime::currentMSecsSinceEpoch();

        quint64 now_ms = QDateTime::currentMSecsSinceEpoch();
        quint64 diff_ms = now_ms - last_ms;
        double speed_b =  (m_bytes_available_tally * 1000.0) / diff_ms;

        if(diff_ms >= 200){
            last_ms = now_ms;
            m_bytes_available_tally = 0;
            emit speed(quint64(speed_b/1024));
        }

        m_bytes_available_tally += m_network_reply->bytesAvailable();
        m_file->write(m_network_reply->readAll());
    }
}

void Downloader::error(QNetworkReply::NetworkError err){
    QFile file(m_file->fileName());
    file.remove();
    emit downloadError(err);
}

void Downloader::change_picture_option(const QString &option){

  //  //qDebug()<<"fghjkghj"+option;
    QString program;
    program = "gsettings";
    QStringList args;
    if(option=="icon"){
        QString i = "true";
        args<<"set"<<"org.gnome.desktop.background"<<"show-desktop-icons"<<i;
    }
    else if(option=="no_icon"){
        QString i = "false";
        args<<"set"<<"org.gnome.desktop.background"<<"show-desktop-icons"<<i;
    }
    else{
    args <<"set"<<"org.gnome.desktop.background" <<"picture-options"<<option;
    }
    QProcess *myProces = new QProcess(0);
    myProces->start(program, args);
   // //qDebug()<<program<< args;
    myProces->waitForFinished();

}



Downloader::~Downloader()
{

}

void Downloader::damn(){
    Downloader d;
     d.nextrandWall();
}
void Downloader::damn1(){
    Downloader d;
    d.nextWall();
}
void Downloader::damn2(){
    Downloader d;
    d.prevWall();
}
