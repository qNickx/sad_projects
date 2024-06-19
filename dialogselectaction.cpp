#include "dialogselectaction.h"
#include "ui_dialogselectaction.h"

DialogSelectaction::DialogSelectaction(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogSelectaction)
{
    ui->setupUi(this);
    setFixedSize(this->size());
}

DialogSelectaction::~DialogSelectaction()
{
    delete ui;
}

int DialogSelectaction::getNumber()
{
    return ui->lineEdit->text().toInt();
}

void DialogSelectaction::setLabel(bool b)
{
    if (b) {
        ui->label->setText(tr("Enter number of record you want to DELETE:"));
        ui->label->adjustSize();
        setWindowTitle(tr("Removal"));
        ui->pushButton->setText(tr("Delete"));
    }
    else {
        ui->label->setText(tr("Enter number of record you want to EDIT:"));
        ui->label->adjustSize();
        setWindowTitle(tr("Editing"));
        ui->pushButton->setText(tr("Edit"));
    }
}

void DialogSelectaction::on_pushButton_clicked()
{
    getNumber();
    accept();
}

