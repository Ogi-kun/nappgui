/** 
 * Pop-up button
 * 
 * See_Also: https://nappgui.com/en/gui/popup.html
 */
module nappgui.gui.popup;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

PopUp *popup_create();

void popup_OnSelect(PopUp *popup, Listener *listener);

void popup_tooltip(PopUp *popup, const char_t *text);

void popup_add_elem(PopUp *popup, const char_t *text, const Image *image);

void popup_set_elem(PopUp *popup, uint32_t index, const char_t *text, const Image *image);

void popup_clear(PopUp *popup);

uint32_t popup_count(const PopUp *popup);

void popup_list_height(PopUp *popup, uint32_t elems);

void popup_selected(PopUp *popup, uint32_t index);

uint32_t popup_get_selected(const PopUp *popup);

