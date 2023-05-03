**Note**: This is a WIP project.

Provides D bindings to [NAppGUI](https://nappgui.com/en/home/web/home.html). 

> NAppGUI is a professional SDK to build cross-platform desktop applications using The C Programming Language (ANSI C90). 
> NAppGUI has built as a lightweight layer on top of the operating system native APIs, that allows create portable programs 
> extremelly fast and small without any external dependency.

Compatible with `@nogc`, `nothrow` and BetterC. Requires static linking with [NAppGUI libraries](https://nappgui.com/en/download/download.html). 

## Windows
Using NAppGUI on Windows currently requires Visual Studio. When using debug libraries, make sure to pass `-mscrtlib=libcmtd` to compiler. To hide 
Command Prompt window, use `"/SUBSYSTEM:windows"` and `"/ENTRY:wmainCRTStartup"` linker options.

## Example
### dub.json
```JSON
{
    "dflags" : ["-checkaction=C"],
    "libs" : ["core", "draw2d", "geom2d", "gui", "inet", "osapp", "osbs", "osgui", "sewer"],
    "libs-windows" : ["user32", "gdi32", "shell32", "comdlg32"],
    "buildTypes" : {
        "debug" : {
            "buildOptions" : ["debugMode", "debugInfo"],
            "dflags-windows" : ["-mscrtlib=libcmtd"]
        }
    }
```
### app.d
```D
import nappgui;
import nappgui.osapp.osmain;
import nappgui.draw2d.guictx;

struct App {
    Window* window;
    TextView* text;
    uint clicks;

    extern(C) nothrow @nogc {
        static App* create() {
            auto app = heap_new0!App;
            auto panel = panel_create();
            auto layout = layout_create(1, 3);
            auto label = label_create();
            auto button = button_push();
            auto text = textview_create();

            app.text = text;
            label_text(label, "Hello, I'm a label!");
            button_text(button, "Click Me!");
            button_OnClick(button, app.listen!(App.onClickMeClick));
            
            layout_label(layout, label, 0, 0);
            layout_button(layout, button, 0, 1);
            layout_textview(layout, text, 0, 2);
            layout_hsize(layout, 0, 250);
            layout_vsize(layout, 2, 100);
            layout_margin(layout, 5);
            layout_vmargin(layout, 0, 5);
            layout_vmargin(layout, 1, 5);
            panel_layout(panel, layout);

            app.window = window_create(ekWINDOW_STD);
            window_panel(app.window, panel);
            window_title(app.window, "Hello, World!");
            window_origin(app.window, v2df(500, 200));
            window_OnClose(app.window, app.listen!(App.onClose));
            window_show(app.window);

            return app;
        }

        static void destroy(App** app) {
            window_destroy(&(*app).window);
            heap_delete(app);
        }

        void onClickMeClick(Event* e) {
            auto msg = str_printf("Button click (%d)\n", clicks);
            textview_writef(text, tc(msg));
            str_destroy(&msg);
            clicks++;
        }

        void onClose(Event* e) {
            osapp_finish();
        }
    }
}

mixin osmain!(App.create, App.destroy, "");
```
