#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Button.H>

int main(int argc, char **argv) {
    // Окно 300x180
    Fl_Window *window = new Fl_Window(300, 180, "Привет из Docker!");
    Fl_Button *button = new Fl_Button(80, 60, 140, 40, "Нажми меня!");
    window->end();
    window->show(argc, argv);
    return Fl::run();
}