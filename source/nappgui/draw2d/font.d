/** 
 * Fonts
 * 
 * See_Also: https://nappgui.com/en/draw2d/font.html
 */
module nappgui.draw2d.font;


import nappgui.core.arrpt;
import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Font *font_create(const char_t *family, real32_t size, uint32_t style);

Font *font_system(real32_t size, uint32_t style);

Font *font_monospace(real32_t size, uint32_t style);

Font *font_with_style(const Font *font, uint32_t style);

Font *font_copy(const Font *font);

void font_destroy(Font **font);

bool_t font_equals(const Font *font1, const Font *font2);

real32_t font_regular_size();

real32_t font_small_size();

real32_t font_mini_size();

const(char_t)* font_family(const Font *font);

real32_t font_size(const Font *font);

real32_t font_height(const Font *font);

uint32_t font_style(const Font *font);

void font_extents(const Font *font, const char_t *text, real32_t refwidth, real32_t *width, real32_t *height);

bool_t font_exists_family(const char_t *family);

ArrPt!String *font_installed_families();

const(void)* font_native(const Font *font);


