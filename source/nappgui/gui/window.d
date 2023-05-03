/** 
 * Windows
 * 
 * See_Also: https://nappgui.com/en/gui/window.html
 */
module nappgui.gui.window;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Window *window_create(uint32_t flags);

void window_destroy(Window **window);

void window_panel(Window *window, Panel *panel);

void window_OnClose(Window *window, Listener *listener);

void window_OnMoved(Window *window, Listener *listener);

void window_OnResize(Window *window, Listener *listener);

void window_title(Window *window, const char_t *text);

void window_show(Window *window);

void window_hide(Window *window);

uint32_t window_modal(Window *window, Window *parent);

void window_stop_modal(Window *window, uint32_t return_value);

void window_hotkey(Window *window, vkey_t key, uint32_t modifiers, Listener *listener);

void window_update(Window *window);

void window_origin(Window *window, const V2Df origin);

void window_size(Window *window, const S2Df size);

V2Df window_get_origin(const Window *window);

S2Df window_get_size(const Window *window);

S2Df window_get_client_size(const Window *window);

void window_defbutton(Window *window, Button *button);

void window_cursor(Window *window, gui_cursor_t cursor, 
        const Image *image, real32_t hot_x, real32_t hot_y);

void *window_imp(const Window *window);

