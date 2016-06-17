#include <QQmlEngine>
#include <QtQml>
#include <QApplication>
#include <QGuiApplication>
#include <QSettings>
#include <QQmlApplicationEngine>
#include <downloader.h>

//tray stuff
#include <QMessageBox>
#include <QAction>
#include <QMenu>
#include <QSystemTrayIcon>
#include <QWindow>


#undef signals
extern "C" {
  #include <libappindicator/app-indicator.h>
  #include <gtk/gtk.h>

  void quitIndicator(GtkMenu *, gpointer);
  void nextIndicator(GtkMenu *, gpointer);
  void prevIndicator(GtkMenu *, gpointer);
  void randIndicator(GtkMenu *, gpointer);
  void showIndicator(GtkCheckMenuItem *, gpointer);

}
#define signals public

//the proxy functions
void quitIndicator(GtkMenu *menu, gpointer data) {
  Q_UNUSED(menu);
  QApplication *self = static_cast<QApplication *>(data);
   self->quit();
}
void nextIndicator(GtkMenu *menu, gpointer data) {
  Q_UNUSED(menu);
    Downloader *d = static_cast<Downloader *>(data);
    d->damn1();

}
void prevIndicator(GtkMenu *menu, gpointer data) {
  Q_UNUSED(menu);
    Downloader *d = static_cast<Downloader *>(data);
    d->damn2();
}
void randIndicator(GtkMenu *menu, gpointer data) {
  Q_UNUSED(menu);
    Downloader *d = static_cast<Downloader *>(data);
    d->damn();
}
void showIndicator(GtkCheckMenuItem *menu, gpointer data) {
    bool checked = gtk_check_menu_item_get_active(menu);
    QApplication *self = static_cast<QApplication *>(data);
    if(checked)
        self->allWindows().at(0)->show();
    else
        self->allWindows().at(0)->hide();
}


void ShowUnityAppIndicator()
{


    AppIndicator *indicator;
    GtkWidget *menu, *item , *next ,*prev,*rand,*show,*sepe;


    menu = gtk_menu_new();
    sepe = gtk_separator_menu_item_new();

    //show Item
    show  = gtk_check_menu_item_new_with_label("Show Application");
    gtk_check_menu_item_set_active((GtkCheckMenuItem*)show, true);
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), show);
    g_signal_connect(show, "toggled", G_CALLBACK(showIndicator), qApp);

    //rand item
    rand = gtk_menu_item_new_with_label("Random Wallaper");
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), rand);
    g_signal_connect(rand, "activate", G_CALLBACK(randIndicator), qApp);

    //seperator item
     gtk_menu_shell_append(GTK_MENU_SHELL(menu), sepe);

    //next item
    prev = gtk_menu_item_new_with_label("Previous Wallpaper");
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), prev);
    g_signal_connect(prev, "activate", G_CALLBACK(prevIndicator), qApp);

    //prev item
    next = gtk_menu_item_new_with_label("Next Wallpaper");
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), next);
    g_signal_connect(next, "activate", G_CALLBACK(nextIndicator), qApp);

    //seperator item
     gtk_menu_shell_append(GTK_MENU_SHELL(menu), sepe);

    //quit item
    item = gtk_menu_item_new_with_label("Quit");
    gtk_menu_shell_append(GTK_MENU_SHELL(menu), item);
    g_signal_connect(item, "activate", G_CALLBACK(quitIndicator), qApp);
                 // We cannot connect
                 // gtk signal and qt slot so we need to create proxy
                 // function later on, we pass qApp pointer as an argument.
                 // This is useful when we need to call signals on "this"
                 // object so external function can access current object


    gtk_widget_show(show);
    gtk_widget_show(rand);
    gtk_widget_show(sepe);
    gtk_widget_show(next);
    gtk_widget_show(prev);
    gtk_widget_show(item);


    indicator = app_indicator_new(
    "deskie", "Deskie",
      APP_INDICATOR_CATEGORY_APPLICATION_STATUS
    );
    app_indicator_set_status(indicator, APP_INDICATOR_STATUS_ACTIVE);
    app_indicator_set_menu(indicator, GTK_MENU(menu));
    app_indicator_set_icon(indicator ,"Deskie");
}




int main(int argc, char *argv[])
{
  QApplication app(argc, argv);

  //tray stuff
  if (!QSystemTrayIcon::isSystemTrayAvailable()) {
         QMessageBox::critical(0, QObject::tr("Systray"),
                                  QObject::tr("I couldn't detect any system tray "
                                              "on this system."));
         return 1;
     }
     QApplication::setQuitOnLastWindowClosed(false);
  //end tray stuff


  QApplication::setApplicationName("Deskie");
  QApplication::setApplicationVersion("2.0");
  QApplication::setOrganizationName("org.keshavnrj.deskie");

  //app setting saving using qsetting class
  QSettings settings;
  QString appname = qApp->applicationName();
  settings.setValue("App", appname);


  qmlRegisterType<Downloader>("Downloader", 1, 0, "Downloader");
  QQmlApplicationEngine engine;

  engine.addImportPath(QGuiApplication::applicationDirPath() + QStringLiteral("Mut/"));
  engine.load(QUrl(QStringLiteral("qrc:///main.qml")));


  //Determine the desktop type
//          QString desktop;
//          bool is_unity;

//          desktop = getenv("XDG_CURRENT_DESKTOP");
//          is_unity = (desktop.toLower() == "unity");

//          if(is_unity)
//          {
//             ShowUnityAppIndicator();
//          }

//          else{
//  //tray stuffs
//  QObject *root = 0;
//      if (engine.rootObjects().size() > 0)
//      {
//          root = engine.rootObjects().at(0);

//          QAction *minimizeAction = new QAction(QObject::tr("Mi&nimize"), root);
//          root->connect(minimizeAction, SIGNAL(triggered()), root, SLOT(hide()));

//          QAction *maximizeAction = new QAction(QObject::tr("Ma&ximize"), root);
//          root->connect(maximizeAction, SIGNAL(triggered()), root, SLOT(showMaximized()));

//          QAction *restoreAction = new QAction(QObject::tr("&Restore"), root);
//          root->connect(restoreAction, SIGNAL(triggered()), root, SLOT(showNormal()));

//          QAction *nextrandpaper = new QAction(QObject::tr("Random Wallpaper"), root);
//          root->connect(nextrandpaper, SIGNAL(triggered()), root, SLOT(nextrandWall()));

//          QAction *nextWallpaper = new QAction(QObject::tr("Next Wallpaper"), root);
//          root->connect(nextWallpaper, SIGNAL(triggered()), root, SLOT(nextWall()));

//          QAction *prevWallpaper = new QAction(QObject::tr("Previous Wallpaper"), root);
//          root->connect(prevWallpaper, SIGNAL(triggered()), root, SLOT(prevWall()));

//          QAction *quitAction = new QAction(QObject::tr("&Quit"), root);
//          root->connect(quitAction, SIGNAL(triggered()), qApp, SLOT(quit()));

//          QMenu *trayIconMenu = new QMenu();
//          trayIconMenu->addAction(minimizeAction);
//          trayIconMenu->addAction(maximizeAction);
//          trayIconMenu->addAction(restoreAction);
//          trayIconMenu->addSeparator();
//          trayIconMenu->addAction(nextrandpaper);
//          trayIconMenu->addAction(nextWallpaper);
//          trayIconMenu->addAction(prevWallpaper);

//          trayIconMenu->addSeparator();
//          trayIconMenu->addAction(quitAction);

//          QSystemTrayIcon *trayIcon = new QSystemTrayIcon(root);
//          trayIcon->setContextMenu(trayIconMenu);
//          trayIcon->setIcon(QIcon(":/icons/tray_icon.png"));
//          trayIcon->show();
//      }
//}
  ShowUnityAppIndicator();

  return app.exec();
}
