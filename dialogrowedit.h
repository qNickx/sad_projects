/*!
 * \author Колбин Н.Д.
 * \version 1.0
 * \brief Заголовочный файл с описанием класса dialogrowedit
 */

#ifndef DIALOGROWEDIT_H
#define DIALOGROWEDIT_H

#include <QDialog>

namespace Ui {
class Dialogrowedit;
}
/*!
 * \brief The Dialogrowedit class - класс диалогового окна для добавления и изменения записей
 */
class Dialogrowedit : public QDialog
{
    Q_OBJECT

public:
    /*!
     * \brief Dialogrowedit - конструктор по умолчанию
     * \param parent - указатель на родителя объекта
     */

    explicit Dialogrowedit(QWidget *parent = nullptr);
    /*!
     * \brief Dialogrowedit - деструктор по умолчанию
     */
    ~Dialogrowedit();
    /*!
     * \brief getInput - функция возвращающая значения введенные пользователем
     */
    void getInput(QString&, QString&, QString&, QString&, QString&, QString&);
    /*!
     * \brief setLabel  - функция устанавливающая текст в слоях, заголовке и на кнопках
     */
    void setLabel(bool, QString);

private slots:
    /*!
     * \brief on_pushButton_clicked - функция для работы кнопки
     */
    void on_pushButton_clicked();

private:
    Ui::Dialogrowedit *ui;
};

#endif // DIALOGROWEDIT_H
