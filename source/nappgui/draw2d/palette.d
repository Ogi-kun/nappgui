/** 
 * Color palette
 * 
 * See_Also: https://nappgui.com/en/draw2d/palette.html
 */
module nappgui.draw2d.palette;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Palette *palette_create(uint32_t size);

Palette *palette_cga2(bool_t mode, bool_t intense);

Palette *palette_ega4();

Palette *palette_rgb8();

Palette *palette_gray1();

Palette *palette_gray2();

Palette *palette_gray4();

Palette *palette_gray8();

Palette *palette_binary(color_t zero, color_t one);

void palette_destroy(Palette **palette);

uint32_t palette_size(const Palette *palette);

color_t *palette_colors(Palette *palette);

const(color_t) *palette_ccolors(const Palette *palette);
