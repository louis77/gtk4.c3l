module gtk4;

import glib;

distinct Widget = void*;
distinct Button = void*;
distinct Window = void*;
distinct Box = void*;

enum Orientation : CInt
{
  ORIENTATION_HORIZONTAL,
  ORIENTATION_VERTICAL
}

extern fn Application *     application_new (ZString application_id, glib::ApplicationFlags flags) @extern("gtk_application_new");

extern fn Widget*           window_new () @extern("gtk_window_new");
extern fn void              window_set_application (Window *window, Application *application) @extern("gtk_window_set_application");
extern fn void              window_present (Window *window) @extern("gtk_window_present");
extern fn void              window_set_title (Window *window, ZString title) @extern("gtk_window_set_title");
extern fn void              window_set_default_size (Window *window, CInt width, CInt height) @extern("gtk_window_set_default_size");
extern fn void              window_set_child (Window *window, Widget *child) @extern("gtk_window_set_child");
extern fn void              window_destroy (Window *window) @extern("gtk_window_destroy");

extern fn Widget*           label_new (ZString str) @extern("gtk_label_new");

extern fn Widget*           button_new_with_label (ZString label) @extern("gtk_button_new_with_label");

extern fn Widget*           box_new (Orientation orientation, CInt spacing) @extern("gtk_box_new");
extern fn void              box_set_homogeneous (Box *box, bool homogeneous) @extern("gtk_box_set_homogeneous");
extern fn void              box_append (Box *box, Widget *child) @extern("gtk_box_append");