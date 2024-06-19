/*!
 * \author Колбин Н.Д.
 * \version 1.0
 * \brief Заголовочный файл с описанием класса mainwindow
 */

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTranslator>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class QActionGroup;

/*!
 * \brief The MainWindow class - класс отображения главного окна
 */
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    /*!
     * \brief MainWindow - конструктор по умолчанию
     * \param parent - указатель на родителя объекта
     */
    MainWindow(QWidget *parent = nullptr);
    /*!
     * \brief MainWindow - деструктор по умолчанию
     */
    ~MainWindow();

private slots:

    /*!
     * \brief on_pushButtonConnect_clicked - функция для подключения к базе данных PostgreSQL
     */
    void on_pushButtonConnect_clicked();
    /*!
     * \brief on_pushButtonQuery_clicked - функция для формирования и вывода таблиц из базы данных PostgreSQL
     */
    void on_pushButtonQuery_clicked();
    /*!
     * \brief on_actionConnect_triggered - функция для подключения к базе данных PostgreSQL
     */
    void on_actionConnect_triggered();
    /*!
     * \brief on_actionDisconnect_triggered - функция для отключения от базы данных PostgreSQL
     */
    void on_actionDisconnect_triggered();
    /*!
     * \brief on_actionAbout_author_triggered - функция вывода диалогового окна "Об авторе"
     */
    void on_actionAbout_author_triggered();
    /*!
     * \brief on_actionAdd_triggered - функция вывода диалогового окна добавления и изменения строки и передачи введенных данных в функцию addRow
     */
    void on_actionAdd_triggered();
    /*!
     * \brief switchLanguage - функция смены языка приложения
     * \param action - переменная класса QAction
     */
    void switchLanguage(QAction *action);
    /*!
     * \brief on_actionDelete_triggered - функция вывода диалогового окна удаления строки передачи введенных данных в функцию deleteRow
     */
    void on_actionDelete_triggered();
    /*!
     * \brief on_actionEdit_triggered - функция вывода диалоговых окок " и "rowAddEdit" и передачи введенных данных в функцию editingRow
     */
    void on_actionEdit_triggered();

private:
    Ui::MainWindow *ui;

    /*!
     * \brief addRow - функция для добавления записи в базу данных PostgreSQL
     */
    void addRow(QString, QString, QString, QString, QString, QString);
    /*!
     * \brief editRow - функция для изменения записи в базе данных PostgreSQL
     */
    void editRow(QString, QString, QString, QString, QString, QString, int);
    /*!
     * \brief setFunc - функция для включения и отключения кнопок программы
     */
    void setFunc(bool);
    /*!
     * \brief readSettings - функция для загрузки размера и положения окна программы
     */
    void readSettings();
    /*!
     * \brief writeSettings - функция для сохранения размера и положения окна программы
     */
    void writeSettings();
    /*!
     * \brief SelectionError - функция вывода диалогового окна с ошибкой, при получении неправильного ввода от пользователя
     */
    void SelectionError();
    /*!
     * \brief checkInput - функция для проверки корректности ввода пользователем ID записи
     * \return
     */
    bool checkInput(int);
    /*!
     * \brief deleteRow - функция для удаления записи из базы данных PostgreSQL
     */
    void deleteRow(int);
    /*!
     * \brief appTranslator - переменная, содержащая переводчик для приложения
     */
    QTranslator appTranslator;
    /*!
     * \brief qtTranslator - переменная, содержащая переводчик для Qt-библиотеки
     */
    QTranslator qtTranslator;
    /*!
     * \brief languageActionGroup - переменная, содержащая группу действий, связанных с выбором языка в приложении
     */
    QActionGroup *languageActionGroup;
    /*!
     * \brief qmPath - переменная, хранящая путь до файлов перевода в формате qm
     */
    QString qmPath;

    /*!
     * \brief createLanguageMenu - функция для создания меню выбора языка
     */
    void createLanguageMenu();


};
#endif // MAINWINDOW_H
