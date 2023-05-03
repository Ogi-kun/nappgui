/* System globals */
module nappgui.gui.globals;

import nappgui.osbs.osbs;
import nappgui.geom2d.geom2d;

extern(C) @nogc nothrow:

device_t globals_device();

void globals_resolution(S2Df *resolution);

V2Df globals_mouse_position();
