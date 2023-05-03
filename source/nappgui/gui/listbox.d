/** 
 * Listbox
 * 
 * See_Also: https://nappgui.com/en/gui/listbox.html
 */
module nappgui.gui.listbox;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

ListBox *listbox_create();

void listbox_OnSelect(ListBox *listbox, Listener *listener);

void listbox_size(ListBox *listbox, S2Df size);

void listbox_checkbox(ListBox *listbox, bool_t show);

void listbox_multisel(ListBox *listbox, bool_t multisel);

void listbox_add_elem(ListBox *listbox, const char_t *text, const Image *image);

void listbox_set_elem(ListBox *listbox, uint32_t index, const char_t *text, const Image *image);

void listbox_clear(ListBox *listbox);

void listbox_color(ListBox *listbox, uint32_t index, color_t color);

void listbox_select(ListBox *listbox, uint32_t index, bool_t select);

void listbox_check(ListBox *listbox, uint32_t index, bool_t check);

uint32_t listbox_count(const ListBox *listbox);

const(char_t)* listbox_text(const ListBox *listbox, uint32_t index);

bool_t listbox_selected(const ListBox *listbox, uint32_t index);

bool_t listbox_checked(const ListBox *listbox, uint32_t index);


