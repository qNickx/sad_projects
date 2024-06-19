/*!
 * \author Колбин Н.Д.
 * \version 1.0
 * \brief Заголовочный файл с описанием класса dialogselectaction
 */

#ifndef DIALOGSELECTACTION_H
#define DIALOGSELECTACTION_H

#include <QDialog>

namespace Ui {
class DialogSelectaction;
}
/*!
 * \brief The DialogSelectaction class - класс диалогового окна для выбора строки
 */
class DialogSelectaction : public QDialog
{
    Q_OBJECT

public:
    /*!
     * \brief DialogSelectaction - конструктор по умолчанию
     * \param parent - указатель на родителя объекта
     */
    explicit DialogSelectaction(QWidget *parent = nullptr);
    /*!
     * \brief DialogSelectaction - деструктор по умолчанию
     */
    ~DialogSelectaction();

    /*!
     * \brief getNumber - функция возвращающая значения введенные пользователем
     * \return
     */
    int getNumber();
    /*!
     * \brief setLabel - функция устанавливающая текст в label
     */
    void setLabel(bool);

private slots:
    /*!
     * \brief on_pushButton_clicked - функция для работы кнопки
     */
    void on_pushButton_clicked();

private:
    Ui::DialogSelectaction *ui;
};

#endif // DIALOGSELECTACTION_H
