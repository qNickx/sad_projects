/*!
 * \author Колбин Н.Д.
 * \version 1.0
 * \brief Заголовочный файл с описанием класса dialogauthor
 */

#ifndef DIALOGAUTHOR_H
#define DIALOGAUTHOR_H

#include <QDialog>

namespace Ui {
class Dialogauthor;
}
/*!
 * \brief The Dialogauthor class - класс диалогового окна об авторе
 */
class Dialogauthor : public QDialog
{
    Q_OBJECT

public:
    /*!
     * \brief Dialogauthor - конструктор по умолчанию
     * \param parent - указатель на родителя объекта
     */
    explicit Dialogauthor(QWidget *parent = nullptr);
    /*!
     * \brief Dialogauthor - деструктор по умолчанию
     */
    ~Dialogauthor();

private:
    Ui::Dialogauthor *ui;
};

#endif // DIALOGAUTHOR_H
