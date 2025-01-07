module main;

import std::io;
import gtk4;
import glib;

const APP_ID = "com.github.louis77.c3-gtk";

fn void click_cb (Button *btn, Window *win) {
   gtk4::window_destroy (win);
}

fn void app_activate (Application *app, Pointer user_data) {
    Widget* win = gtk4::window_new ();
    gtk4::window_set_application ((Window*)win, (Application*)app);
    gtk4::window_set_title ((Window*)win, "GTK4 from C3");
    gtk4::window_set_default_size ((Window*)win, 400, 300);

    Widget* box = gtk4::box_new (ORIENTATION_VERTICAL, 5);
    gtk4::box_set_homogeneous ((Box*)box, true);

    Widget* lab = gtk4::label_new ("Hello from C3 😃");
    Widget* btn = gtk4::button_new_with_label ("Click me");
    glib::signal_connect ((Pointer)btn, "clicked", &click_cb, (Pointer)win);

    gtk4::box_append ((Box*)box, lab);
    gtk4::box_append ((Box*)box, btn);

    gtk4::window_set_child ((Window*)win, (Widget*)box);
    gtk4::window_present ((Window*)win);
}

fn int main (int argc, char **argv) {
    Application* app = gtk4::application_new (APP_ID, (ApplicationFlags)0);
    glib::signal_connect((Pointer)app, "activate", &app_activate, (Pointer)0);
    CInt stat = glib::application_run ((Application*)app, argc, argv);
    glib::object_unref ((Pointer)app);
    return (int)stat;
}
