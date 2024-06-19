#include "dialogauthor.h"
#include "ui_dialogauthor.h"

Dialogauthor::Dialogauthor(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialogauthor)
{
    ui->setupUi(this);
    //setFixedSize(this->size());
    setWindowTitle(tr("About Author"));
    ui->label->setText(tr("This program developed by \nKolbin Nikita ICTMS 3-8"));
    ui->pushButton->setText("OK");
}

Dialogauthor::~Dialogauthor()
{
    delete ui;
}
