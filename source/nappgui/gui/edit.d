/** 
 * Edit Box
 * 
 * See_Also: https://nappgui.com/en/gui/comeditwin.html
 */
module nappgui.gui.edit;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Edit *edit_create();

Edit *edit_multiline();

void edit_OnFilter(Edit *edit, Listener *listener);

void edit_OnChange(Edit *edit, Listener *listener);

void edit_text(Edit *edit, const char_t *text);

void edit_font(Edit *edit, const Font *font);

void edit_align(Edit *edit, align_t align_);

void edit_passmode(Edit *edit, bool_t passmode);

void edit_editable(Edit *edit, bool_t is_editable);

void edit_autoselect(Edit *edit, bool_t autoselect);

void edit_tooltip(Edit *edit, const char_t *text);

void edit_color(Edit *edit, color_t color);

void edit_color_focus(Edit *edit, color_t color);

void edit_bgcolor(Edit *edit, color_t color);

void edit_bgcolor_focus(Edit *edit, color_t color);

void edit_phtext(Edit *edit, const char_t *text);

void edit_phcolor(Edit *edit, color_t color);

void edit_phstyle(Edit *edit, uint32_t fstyle);

const(char_t) *edit_get_text(const Edit *edit);
