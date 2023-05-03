/** 
 * Label
 * 
 * See_Also: https://nappgui.com/en/gui/label.html
 */
module nappgui.gui.label;

import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.gui.gui;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Label *label_create();

Label *label_multiline();

void label_OnClick(Label *label, Listener *listener);

void label_text(Label *label, const char_t *text);

void label_font(Label *label, const Font *font);

void label_style_over(Label *label, uint32_t fstyle);

void label_align(Label *label, align_t align_);

void label_color(Label *label, color_t color);

void label_color_over(Label *label, color_t color);

void label_bgcolor(Label *label, color_t color);

void label_bgcolor_over(Label *label, color_t color);
