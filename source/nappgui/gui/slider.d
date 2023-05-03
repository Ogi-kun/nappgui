/** 
 * Slider
 * 
 * See_Also: https://nappgui.com/en/gui/slider.html
 */
module nappgui.gui.slider;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Slider *slider_create();

Slider *slider_vertical();

void slider_OnMoved(Slider *slider, Listener *listener);

void slider_tooltip(Slider *slider, const char_t *text);

void slider_steps(Slider *slider, uint32_t steps);

void slider_value(Slider *slider, real32_t value);

real32_t slider_get_value(const Slider *slider);


