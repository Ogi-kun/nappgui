/** 
 * Combo box
 * 
 * See_Also: https://nappgui.com/en/gui/combo.html
 */
module nappgui.gui.combo;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Combo *combo_create();

void combo_OnFilter(Combo *combo, Listener *listener);

void combo_OnChange(Combo *combo, Listener *listener);

void combo_text(Combo *combo, const char_t *text);

void combo_align(Combo *combo, align_t align_);

void combo_tooltip(Combo *combo, const char_t *text);

void combo_color(Combo *combo, color_t color);

void combo_color_focus(Combo *combo, color_t color);

void combo_bgcolor(Combo *combo, color_t color);

void combo_bgcolor_focus(Combo *combo, color_t color);

void combo_phtext(Combo *combo, const char_t *text);

void combo_phcolor(Combo *combo, color_t color);

void combo_phstyle(Combo *combo, uint32_t fstyle);

const(char_t)* combo_get_text(const Combo *combo, uint32_t index);

uint32_t combo_count(const Combo *combo);

void combo_add_elem(Combo *combo, const char_t *text, const Image *image);

void combo_set_elem(Combo *combo, uint32_t index, const char_t *text, const Image *image);

void combo_ins_elem(Combo *combo, uint32_t index, const char_t *text, const Image *image);

void combo_del_elem(Combo *combo, uint32_t index);

void combo_duplicates(Combo *combo, bool_t duplicates);

