#include <QApplication>
#include <QWidget>
#include <QVBoxLayout>
#include <QLabel>
#include <QPushButton>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QWidget window;
    window.setFixedSize(400, 200);
    window.setWindowTitle("Qt6 Docker App");

    QVBoxLayout *layout = new QVBoxLayout(&window);
    QLabel *label = new QLabel("Привет из Docker-контейнера с Qt6!");
    label->setAlignment(Qt::AlignCenter);
    layout->addWidget(label);

    QPushButton *button = new QPushButton("Нажми меня");
    button->setFixedSize(120, 30);
    layout->addWidget(button, 0, Qt::AlignCenter);

    window.show();
    return app.exec();
}