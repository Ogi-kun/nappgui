/** 
 * Up Down
 * 
 * See_Also: https://nappgui.com/en/gui/updown.html
 */
module nappgui.gui.updown;

import nappgui.core.core;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

UpDown *updown_create();

void updown_OnClick(UpDown *updown, Listener *listener);

void updown_tooltip(UpDown *updown, const char_t *text);
