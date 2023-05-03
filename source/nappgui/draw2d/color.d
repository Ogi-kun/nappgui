/** 
 * Color
 * 
 * See_Also: https://nappgui.com/en/draw2d/color.html
 */
module nappgui.draw2d.color;

import nappgui.sewer.types;
import nappgui.draw2d.draw2d;

extern(C) @nogc nothrow:

color_t color_rgb(uint8_t r, uint8_t g, uint8_t b);

color_t color_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a);

color_t color_rgbaf(real32_t r, real32_t g, real32_t b, real32_t a);

color_t color_hsbf(real32_t hue, real32_t sat, real32_t bright);

color_t color_red(uint8_t r);

color_t color_green(uint8_t g);

color_t color_blue(uint8_t b);

color_t color_gray(uint8_t l);

color_t color_bgr(uint32_t bgr);

color_t color_html(const char_t *html);

color_t color_indexed(uint16_t index, color_t color);

void color_to_hsbf(color_t color, real32_t *hue, real32_t *sat, real32_t *bright);

void color_to_html(color_t color, char_t *html, uint32_t size);

void color_get_rgb(color_t color, uint8_t *r, uint8_t *g, uint8_t *b);

void color_get_rgbf(color_t color, real32_t *r, real32_t *g, real32_t *b);

void color_get_rgba(color_t color, uint8_t *r, uint8_t *g, uint8_t *b, uint8_t *a);

void color_get_rgbaf(color_t color, real32_t *r, real32_t *g, real32_t *b, real32_t *a);

uint8_t color_get_alpha(color_t color);

color_t color_set_alpha(color_t color, uint8_t alpha);

extern export __gshared {
    const color_t kCOLOR_TRANSPARENT;
    const color_t kCOLOR_DEFAULT;
    const color_t kCOLOR_BLACK;
    const color_t kCOLOR_WHITE;
    const color_t kCOLOR_RED;
    const color_t kCOLOR_GREEN;
    const color_t kCOLOR_BLUE;
    const color_t kCOLOR_YELLOW;
    const color_t kCOLOR_CYAN;
    const color_t kCOLOR_MAGENTA;
}
