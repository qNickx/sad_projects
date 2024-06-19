#include "dialogrowedit.h"
#include "ui_dialogrowedit.h"

Dialogrowedit::Dialogrowedit(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialogrowedit)
{
    ui->setupUi(this);
}

Dialogrowedit::~Dialogrowedit()
{
    delete ui;
}

void Dialogrowedit::getInput(QString &lineedit2, QString &lineedit3, QString &lineedit4, QString &lineedit5, QString &lineedit6, QString &lineedit7)
{
    lineedit2 = ui->lineEdit_2->text();
    lineedit3 = ui->lineEdit_3->text();
    lineedit4 = ui->lineEdit_4->text();
    lineedit5 = ui->lineEdit_5->text();
    lineedit6 = ui->lineEdit_6->text();
    lineedit7 = ui->lineEdit_7->text();
}

void Dialogrowedit::setLabel(bool a, QString tableName)
{
    if (a){
        ui->label->setText(tr("Adding values into table:"));
        setWindowTitle(tr("Adding new record"));
        ui->pushButton->setText(tr("Add"));
    }
    else
    {
        ui->label->setText(tr("Editing values into table:"));
        setWindowTitle(tr("Editing existing record"));
        ui->pushButton->setText(tr("Edit"));
    }

    if (tableName == "certificates")
    {
        ui->label_2->setText(tr("Enter \"certificate number\":"));
        ui->label_3->setText(tr("Enter \"release date\":"));
        ui->label_4->setText(tr("Enter \"expiration date\":"));
        ui->label_5->setText(tr("Enter \"status of certificate\":"));
        ui->label_6->setText(tr(""));
        ui->label_7->setText(tr(""));
        ui->lineEdit_2->setEnabled(true);
        ui->lineEdit_3->setEnabled(true);
        ui->lineEdit_4->setEnabled(true);
        ui->lineEdit_5->setEnabled(true);
        ui->lineEdit_6->setEnabled(false);
        ui->lineEdit_7->setEnabled(false);
    }
    else if (tableName == "stockholders"){
        ui->label_2->setText(tr("Enter \"stockholder's firstname\":"));
        ui->label_3->setText(tr("Enter \"stockholder's lastname\":"));
        ui->label_4->setText(tr("Enter \"stockholder's telephone\":"));
        ui->label_5->setText(tr("Enter \"stockholder's email\":"));
        ui->label_6->setText(tr(""));
        ui->label_7->setText(tr(""));
        ui->lineEdit_2->setEnabled(true);
        ui->lineEdit_3->setEnabled(true);
        ui->lineEdit_4->setEnabled(true);
        ui->lineEdit_5->setEnabled(true);
        ui->lineEdit_6->setEnabled(false);
        ui->lineEdit_7->setEnabled(false);
    }
    else if (tableName == "stocks"){
        ui->label_2->setText(tr("Enter \"stock type ID\":"));
        ui->label_3->setText(tr("Enter \"Number of stocks\":"));
        ui->label_4->setText(tr(""));
        ui->label_5->setText(tr(""));
        ui->label_6->setText(tr(""));
        ui->label_7->setText(tr(""));
        ui->lineEdit_2->setEnabled(true);
        ui->lineEdit_3->setEnabled(true);
        ui->lineEdit_4->setEnabled(false);
        ui->lineEdit_5->setEnabled(false);
        ui->lineEdit_6->setEnabled(false);
        ui->lineEdit_7->setEnabled(false);
    }
    else if (tableName == "stocktype"){
        ui->label_2->setText(tr("Enter \"type of stock\":"));
        ui->label_3->setText(tr(""));
        ui->label_4->setText(tr(""));
        ui->label_5->setText(tr(""));
        ui->label_6->setText(tr(""));
        ui->label_7->setText(tr(""));
        ui->lineEdit_2->setEnabled(true);
        ui->lineEdit_3->setEnabled(false);
        ui->lineEdit_4->setEnabled(false);
        ui->lineEdit_5->setEnabled(false);
        ui->lineEdit_6->setEnabled(false);
        ui->lineEdit_7->setEnabled(false);
    }
    else if (tableName == "transactions"){
        ui->label_2->setText(tr("Enter \"type of transaction\":"));
        ui->label_3->setText(tr("Enter \"date of transaction\":"));
        ui->label_4->setText(tr("Enter \"transaction cost\":"));
        ui->label_5->setText(tr("Enter \"stockholder's ID\":"));
        ui->label_6->setText(tr("Enter \"certificate ID\":"));
        ui->label_7->setText(tr("Enter \"stock ID\":"));
        ui->lineEdit_2->setEnabled(true);
        ui->lineEdit_3->setEnabled(true);
        ui->lineEdit_4->setEnabled(true);
        ui->lineEdit_5->setEnabled(true);
        ui->lineEdit_6->setEnabled(true);
        ui->lineEdit_7->setEnabled(true);
    }
}

void Dialogrowedit::on_pushButton_clicked()
{
    accept();
}

