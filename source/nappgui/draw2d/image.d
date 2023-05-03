/** 
 * Images
 * 
 * See_Also: https://nappgui.com/en/draw2d/image.html
 */
module nappgui.draw2d.image;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.osbs.osbs;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Image *image_from_pixels(uint32_t width, uint32_t height, const pixformat_t format, 
        const byte_t *data, const color_t *palette, uint32_t palsize);

Image *image_from_pixbuf(const Pixbuf *pixbuf, const Palette *palette);

Image *image_from_file(const char_t *pathname, ferror_t *error);

Image *image_from_data(const byte_t *data, uint32_t size);

const(Image) *image_from_resource(const ResPack *pack, const ResId id);

Image *image_copy(const Image *image);

Image *image_trim(const Image *image, uint32_t x, uint32_t y, uint32_t width, uint32_t height);

Image *image_rotate(const Image *image, real32_t angle, bool_t nsize, color_t background, T2Df *t2d);

Image *image_scale(const Image *image, uint32_t nwidth, uint32_t nheight);

Image *image_read(Stream *stm);

bool_t image_to_file(const Image *image, const char_t *pathname, ferror_t *error);

void image_write(Stream *stream, const Image *image);

void image_destroy(Image **image);

pixformat_t image_format(const Image *image);

uint32_t image_width(const Image *image);

uint32_t image_height(const Image *image);

Pixbuf *image_pixels(const Image *image, const pixformat_t format);

bool_t image_codec(const Image *image, const codec_t codec);

codec_t image_get_codec(const Image *image);

uint32_t image_num_frames(const Image *image);

real32_t image_frame_length(const Image *image, uint32_t findex);

void image_data_imp(Image *image, void **data, FPtr_destroy func_destroy_data);

void *image_get_data_imp(const Image *image);

const(void) *image_native(const Image *image);


void image_data(T)(Image* image, T** data, void function(T**) func_destroy_data) {
    image_data_imp(image, cast(void**)data, cast(FPtr_destroy)func_destroy_data);
}

T* image_get_data(T)(const Image* image) {
    return cast(T*)image_get_data_imp(image);
}
