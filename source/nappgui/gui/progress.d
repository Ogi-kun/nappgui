/** 
 * Progress bars
 * 
 * See_Also: https://nappgui.com/en/gui/progress.html
 */
module nappgui.gui.progress;

import nappgui.draw2d.draw2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Progress *progress_create();

void progress_undefined(Progress *progress, bool_t running);

void progress_value(Progress *progress, real32_t value);

