/** 
 * Common windows
 * 
 * See_Also: https://nappgui.com/en/gui/comwin.html
 */
module nappgui.gui.comwin;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

const(char_t)* comwin_open_file(Window *parent, const char_t **ftypes, 
        uint32_t size, const char_t *start_dir);

const(char_t)* comwin_save_file(Window *parent, const char_t **ftypes, 
        uint32_t size, const char_t *start_dir);

void comwin_color(Window *parent, const char_t *title, real32_t x, real32_t y, 
        align_t halign, align_t valign, color_t current, color_t *colors, 
        uint32_t n, Listener *OnChange);
