module glib;

distinct Application = void*;
distinct ApplicationFlags = void*;
distinct Pointer = inline void*;
distinct CharPtr = ZString;
distinct Callback = void*;
distinct ClosureNotify = void*;
distinct ConnectFlags = void*;

extern fn CInt      application_run (Application* application, CInt argc, char** argv) @extern("g_application_run");
extern fn CULong    signal_connect_data (Pointer instance, CharPtr detailed_signal, Callback c_handler, Pointer data, ClosureNotify destroy_data, ConnectFlags connect_flags) @extern("g_signal_connect_data");
extern fn void      object_unref (Pointer object) @extern("g_object_unref");

// C macros

fn CULong signal_connect (Pointer instance, CharPtr detailed_signal, Callback c_handler, Pointer data) @inline => signal_connect_data (instance, detailed_signal, c_handler, data, null, null);