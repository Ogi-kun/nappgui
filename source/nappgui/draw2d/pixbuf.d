/** 
 * Pixel buffers
 * 
 * See_Also: https://nappgui.com/en/draw2d/pixbuf.html
 */
module nappgui.draw2d.pixbuf;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

uint32_t pixbuf_get1()(const byte_t* data, uint32_t x, uint32_t y, uint32_t width) {
    return cast(uint32_t)((data[(y * width + x) / 8] >> cast(byte_t)((y * width + x) % 8)) & 1);
}

Pixbuf *pixbuf_create(uint32_t width, uint32_t height, pixformat_t format);

Pixbuf *pixbuf_copy(const Pixbuf *pixbuf);

Pixbuf *pixbuf_trim(const Pixbuf *pixbuf, uint32_t x, uint32_t y, uint32_t width, uint32_t height);

Pixbuf *pixbuf_convert(const Pixbuf *pixbuf, const Palette *palette, pixformat_t oformat);

void pixbuf_destroy(Pixbuf **pixbuf);

pixformat_t pixbuf_format(const Pixbuf *pixbuf);

uint32_t pixbuf_width(const Pixbuf *pixbuf);

uint32_t pixbuf_height(const Pixbuf *pixbuf);

uint32_t pixbuf_size(const Pixbuf *pixbuf);

uint32_t pixbuf_dsize(const Pixbuf *pixbuf);

const(byte_t) *pixbuf_cdata(const Pixbuf *pixbuf);

byte_t *pixbuf_data(Pixbuf *pixbuf);

uint32_t pixbuf_format_bpp(pixformat_t format);

uint32_t pixbuf_get(const Pixbuf *pixbuf, uint32_t x, uint32_t y);

void pixbuf_set(Pixbuf *pixbuf, uint32_t x, uint32_t y, uint32_t value);
