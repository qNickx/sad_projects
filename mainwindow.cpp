#include "mainwindow.h"
#include "dialogauthor.h"
#include "dialogrowedit.h"
#include "dialogselectaction.h"
#include "ui_mainwindow.h"


#include <QSqlDatabase>
#include <QSqlError>
#include <QDebug>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QMessageBox>
#include <QSettings>
#include <QDir>
#include <QLibraryInfo>

#include "QSqlQueryModel"
#include "QStandardItem"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    readSettings();
    if (QSqlDatabase::isDriverAvailable("QPSQL"))
        qDebug() << "SUCCESS: PostgreSQL database driver found!";
    else
        qDebug() << "FAILURE: PostgreSQL database driver NOT found!";

    qApp->installTranslator(&appTranslator);
    qApp->installTranslator(&qtTranslator);
    qmPath = qApp->applicationDirPath() + "/tr";
    createLanguageMenu();
    // Проверка пути до файлов перевода
    qDebug() << "qmPath: " << qmPath;
}

MainWindow::~MainWindow()
{
    writeSettings();
    delete ui;
}


void MainWindow::on_pushButtonConnect_clicked()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("rdbms.vt");
    db.setPort(5432);
    db.setDatabaseName("mydb");
    db.setUserName("myuser");
    db.setPassword("3");

    bool opened = db.open();
    if (opened) {
        qDebug() << "Connect success!";
        setFunc(true);
    }
    else {
        qDebug() << "Connect failed: " << db.lastError().text();
        QMessageBox::critical(this,tr("App Name"),db.lastError().text());
    }
}


void MainWindow::on_pushButtonQuery_clicked()
{
    QSqlQuery query; // запрос
    QSqlQueryModel *model = new QSqlQueryModel; // модель
    QStringList horizontalHeader; // столбцы таблицы
    QStringList verticalHeader; // строки таблицы

    if (ui->comboBox->currentText() == "certificates") {
        query.exec("SELECT id, certifnumber as \"Number of certificate\", releasedate as \"Release Date\", expirationdate as \"Expiration Date\", \
                    certifstatus as \"Status of certificate\" FROM certificates ORDER BY id ASC");

        horizontalHeader << tr("Number of certificate") << tr("Release Date") << tr("Expiration Date") << tr("Status of certificate");
        for(int i = 0; i < horizontalHeader.size(); ++i) {model->setHeaderData(i, Qt::Horizontal, horizontalHeader[i]);}
        while (query.next())
            verticalHeader.append(query.value(0).toString());

        query.seek(-1);
        model->setQuery(query);
    }
    else if (ui->comboBox->currentText() == "stockholders") {
        query.exec("SELECT id, firstname as \"Firstname\", lastname as \"Lastname\", telephone, email FROM stockholders ORDER BY id ASC");

        horizontalHeader << tr("Firstname") << tr("Lastname") << tr("Telephone") << tr("Email");
        for(int i = 0; i < horizontalHeader.size(); ++i) {model->setHeaderData(i, Qt::Horizontal, horizontalHeader[i]);}
        while (query.next())
            verticalHeader.append(query.value(0).toString());

        query.seek(-1);
        model->setQuery(query);
    }
    else if (ui->comboBox->currentText() == "stocks") {
        query.exec("SELECT stocks.id, stocktype, stockquantity FROM stocks \
                   JOIN stocktype ON stocks.type_id = stocktype.id ORDER BY id ASC");

        horizontalHeader << tr("Type of stock") << tr("Number of shares");
        for(int i = 0; i < horizontalHeader.size(); ++i) {model->setHeaderData(i, Qt::Horizontal, horizontalHeader[i]);}
        while (query.next())
            verticalHeader.append(query.value(0).toString());

        query.seek(-1);
        model->setQuery(query);
    }
    else if (ui->comboBox->currentText() == "stocktype") {
        query.exec("SELECT id, stocktype FROM stocktype ORDER BY id ASC");

        horizontalHeader << tr("Type of stock");
        for(int i = 0; i < horizontalHeader.size(); ++i) {model->setHeaderData(i, Qt::Horizontal, horizontalHeader[i]);}
        while (query.next())
            verticalHeader.append(query.value(0).toString());

        query.seek(-1);
        model->setQuery(query);
    }

    else if (ui->comboBox->currentText() == "transactions") {

        query.exec("SELECT transactions.id, transactiontype as \"Transaction type\", transactiondate as \"Transaction date\", transactionamount, stockholders as \"Stockholder\", certificates as \"Certificate\", stocks as \"Stock\" FROM transactions \
                            JOIN stockholders ON transactions.stockholder_id = stockholders.id \
                            JOIN certificates ON transactions.certificate_id = certificates.id \
                            JOIN stocks ON transactions.stock_id = stocks.id ORDER BY id ASC");

        horizontalHeader << tr("Type of transaction") << tr("Transaction date") << tr("Transaction amount") << tr("Stockholder") << tr("Certificate") << tr("Stock");
        for(int i = 0; i < horizontalHeader.size(); ++i) {model->setHeaderData(i, Qt::Horizontal, horizontalHeader[i]);}
        while (query.next())
            verticalHeader.append(query.value(0).toString());

        query.seek(-1);

        model->setQuery(query);
    }

    ui->tableView->setModel(model);
    ui->tableView->resizeRowsToContents();
    ui->tableView->resizeColumnsToContents();
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
}




void MainWindow::on_actionConnect_triggered()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("rdbms.vt");
    db.setPort(5432);
    db.setDatabaseName("mydb");
    db.setUserName("myuser");
    db.setPassword("3");

    bool opened = db.open();
    if (opened) {
        qDebug() << "Connect success!";
        setFunc(true);
    }
    else {
        qDebug() << "Connect failed: " << db.lastError().text();
        QMessageBox::critical(this,tr("App Name"),db.lastError().text());
    }
}


void MainWindow::on_actionDisconnect_triggered()
{

    QSqlDatabase db = QSqlDatabase::database();
    if (db.isOpen()) {
        db.close();  // Закрываем соединение с базой данных
        qDebug() << "Disconnected from the database.";
    }
    setFunc(false);
    //ui->tableView->reset();
}

void MainWindow::setFunc(bool b)
{
    ui->actionConnect->setEnabled(!b);
    ui->comboBox->setEnabled(b);
    ui->tableView->setEnabled(b);
    ui->pushButtonQuery->setEnabled(b);
    ui->pushButtonConnect->setEnabled(!b);
    ui->menuEdit->setEnabled(b);
}

void MainWindow::readSettings()
{
    QSettings settings("Home","MyProgram");
    settings.beginGroup("MainWindowGeometry");
    resize(settings.value("size", QSize(400, 500)).toSize());
    move(settings.value("pos", QPoint(200, 200 )).toPoint());
}

void MainWindow::writeSettings()
{
    QSettings settings("Home","MyProgram");
    settings.beginGroup("MainWindowGeometry");
    settings.setValue("size", size());
    settings.setValue("pos", pos());
    settings.endGroup();
}

void MainWindow::SelectionError()
{
    QMessageBox ErrorBox;
    ErrorBox.setWindowTitle(QObject::tr("Error"));
    ErrorBox.setText(QObject::tr("Selected Record does not Exist!\nTry Again Or Click \"Cancel\"!"));
    ErrorBox.setStandardButtons(QMessageBox::Ok | QMessageBox::Cancel);
    ErrorBox.setButtonText(QMessageBox::Ok, QObject::tr("Reselect"));
    ErrorBox.setButtonText(QMessageBox::Cancel, QObject::tr("Cancel"));
    ErrorBox.setIcon(QMessageBox::Information);
    ErrorBox.setDefaultButton(QMessageBox::Ok);
    int res = ErrorBox.exec();
    if (res == QMessageBox::Cancel)
        return;
}

bool MainWindow::checkInput(int c)
{
    QSqlQuery query;

    query.exec("SELECT * FROM " + ui->comboBox->currentText());
    while (query.next())
        if (c == query.value(0))
            return true;
    return false;
}

void MainWindow::deleteRow(int d)
{
    QSqlQuery query;

    QString string_d = QString::number(d);
    query.exec("SELECT * FROM " + ui->comboBox->currentText());
    QString columnName = query.record().fieldName(0);
    query.exec("DELETE FROM " + ui->comboBox->currentText() + " WHERE " + columnName + " = " + string_d);
}

void MainWindow::createLanguageMenu()
{
    languageActionGroup = new QActionGroup(this);
    connect(languageActionGroup, &QActionGroup::triggered, this, &MainWindow::switchLanguage);
    QDir dir(qmPath);
    QStringList fileNames = dir.entryList(QStringList("Cursovaya_3kurs_*.qm"));
    for (int i = 0; i < fileNames.size(); i++)
    {
        QString locale = fileNames[i];
        locale.remove(0, locale.indexOf('_') + 1);
        locale.remove(0, locale.indexOf('_') + 1);
        locale.truncate(locale.lastIndexOf('.'));
        QTranslator translator;
        translator.load(fileNames[i], qmPath);
        QString language = translator.translate("MainWindow", "English");
        QAction *action = new QAction(tr("&%1 %2").arg(i + 1).arg(language), this);
        action->setCheckable(true);
        action->setData(locale);
        ui->menuLanguages->addAction(action);
        languageActionGroup->addAction(action);
        if (language == "English")
            action->setChecked(true);
    }
}

void MainWindow::switchLanguage(QAction *action)
{
    QString locale = action->data().toString();
    appTranslator.load("Cursovaya_3kurs_" + locale, qmPath);
    locale.chop(3);
    qtTranslator.load("qt_" + locale, QLibraryInfo::location(QLibraryInfo::TranslationsPath));
    ui->retranslateUi(this);
}

void MainWindow::on_actionAbout_author_triggered()
{
    Dialogauthor Auth;
    Auth.exec();
    if(Auth.result() == Dialogauthor::Rejected)
        return;
}


void MainWindow::on_actionAdd_triggered()
{
    Dialogrowedit Add;
    Add.setLabel(true, ui->comboBox->currentText());
    QString value1, value2, value3, value4, value5, value6;
    while(true) {
        if(Add.exec())
            Add.getInput(value1, value2, value3, value4, value5, value6);
        if(Add.result() == Dialogrowedit::Rejected)
            return;
        else
            break;
    }
    addRow(value1, value2, value3, value4, value5, value6);
    on_pushButtonQuery_clicked();
}

void MainWindow::addRow(QString add1, QString add2, QString add3, QString add4, QString add5, QString add6)
{
    QSqlQuery query;
    QString tableName = ui->comboBox->currentText();
    QString queryValues;
    if (tableName == "certificates")
    {
        queryValues = "(DEFAULT, " + add1 + ", '" + add2 + "', '" + add3 + "', " + add4 + ")";
    }
    else if (tableName == "stockholders"){
        queryValues = "(DEFAULT, '" + add1 + "', '" + add2 + "', '" + add3 + "', '" + add4 + "')";
    }
    else if (tableName == "stocks"){
        queryValues = "(DEFAULT, '" + add1 + "', " + add2 + ")";
    }
    else if (tableName == "stocktype"){
        queryValues = "(DEFAULT, '" + add1 + "')";
    }
    else if (tableName == "transactions"){
        queryValues = "(DEFAULT, '" + add1 + "', '" + add2 + "', " + add3 + ", " + add4 + ", " + add5 + ", " + add6 + ")";
    }
    query.exec("INSERT INTO " + ui->comboBox->currentText() + " VALUES " + queryValues);
}

void MainWindow::editRow(QString edit1, QString edit2, QString edit3, QString edit4, QString edit5, QString edit6, int numberID)
{
    QSqlQuery query;
    QString tableName = ui->comboBox->currentText();
    QString queryValues;
    if (tableName == "certificates"){
        queryValues = "certifnumber = " + edit1 + ", releasedate = '" + edit2 + "', expirationdate = '" + edit3 + "', certifstatus = '" + edit4 + "'";
    }
    else if (tableName == "stockholders"){
        queryValues = "firstname = '" + edit1 + "', lastname = '" + edit2 + "', telephone = '" + edit3 + "', email = '" + edit4 + "'";
    }
    else if (tableName == "stocks"){
        queryValues = "type_id = " + edit1 + ", stockquantity = " + edit2;
    }
    else if (tableName == "stocktype"){
        queryValues = "stocktype = '" + edit1 + "'";
    }
    else if (tableName == "transactions"){
        queryValues = "transactiontype = '" + edit1 + "', transactiondate = '" + edit2 + "', transactionamount = '" + edit3 + "', stockholder_id = " + edit4 + ", certificate_id = " + edit5 + ", stock_id = " + edit6;
    }
    query.exec("SELECT * FROM " + ui->comboBox->currentText());
    QString columnName = query.record().fieldName(0);
    query.exec("UPDATE " + ui->comboBox->currentText() + " SET " + queryValues + " WHERE " + columnName + " = " + QString::number(numberID));

}



void MainWindow::on_actionDelete_triggered()
{
    DialogSelectaction Del;
    Del.setLabel(true);
    int selected;
    while(true)
    {
        if(Del.exec())
            selected = Del.getNumber();
        if(Del.result() == DialogSelectaction::Rejected)
            return;
        if(checkInput(selected))
            break;
        else
            SelectionError();
    }
    deleteRow(selected);
    on_pushButtonQuery_clicked();
}


void MainWindow::on_actionEdit_triggered()
{
    DialogSelectaction Sel;
    Sel.setLabel(false);
    int selected;
    while(true)
    {
        if(Sel.exec())
            selected = Sel.getNumber();
        if(Sel.result() == DialogSelectaction::Rejected)
            return;
        if(checkInput(selected))
            break;
        else
            SelectionError();
    }
    Dialogrowedit Edit;
    Edit.setLabel(false, ui->comboBox->currentText());
    QString value1, value2, value3, value4, value5, value6;
    while(true) {
        if(Edit.exec())
            Edit.getInput(value1, value2, value3, value4, value5, value6);
        if(Edit.result() == Dialogrowedit::Rejected)
            return;
        else
            break;
    }
    editRow(value1, value2, value3, value4, value5, value6, selected);
    on_pushButtonQuery_clicked();
}

