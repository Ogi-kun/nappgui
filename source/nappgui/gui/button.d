/** 
 * Button
 * 
 * See_Also: https://nappgui.com/en/gui/button.html
 */
module nappgui.gui.button;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Button *button_push();

Button *button_check();

Button *button_check3();

Button *button_radio();

Button *button_flat();

Button *button_flatgle();

void button_OnClick(Button *button, Listener *listener);

void button_text(Button *button, const char_t *text);

void button_text_alt(Button *button, const char_t *text);

void button_tooltip(Button *button, const char_t *text);

void button_font(Button *button, const Font *font);

void button_image(Button *button, const Image *image);

void button_image_alt(Button *button, const Image *image);

void button_state(Button *button, gui_state_t state);

gui_state_t button_get_state(const Button *button);

void button_tag(Button *button, uint32_t tag);

uint32_t button_get_tag(const Button *button);
