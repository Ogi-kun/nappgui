/// Undocumented (hidden) API about drawing context
module nappgui.draw2d.dctxh;

import nappgui.draw2d.draw2d;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

DCtx *dctx_create();

void dctx_destroy(DCtx **ctx);

void dctx_set_gcontext(DCtx *ctx, void *gcontext, uint32_t width, uint32_t height, 
        real32_t offset_x, real32_t offset_y, uint32_t background, bool_t reset);

void dctx_unset_gcontext(DCtx *ctx);

void dctx_update_view(DCtx *ctx, void *view);

void dctx_set_flipped(DCtx *ctx, bool_t flipped);

void dctx_size(const DCtx *ctx, uint32_t *width, uint32_t *height);

void dctx_offset(const DCtx *ctx, real32_t *offset_x, real32_t *offset_y);

real32_t dctx_text_width(const DCtx *ctx);

align_t dctx_text_intalign(const DCtx *ctx);

color_t dctx_text_color(const DCtx *ctx);

color_t dctx_background_color(const DCtx *ctx);

ellipsis_t dctx_text_trim(const DCtx *ctx);

void dctx_set_raster_mode(DCtx *ctx);

void *dctx_native(DCtx *ctx);

void *dctx_internal_bitmap(DCtx *ctx);

void dctx_text_raster(DCtx *ctx, const char_t *text, real32_t x, real32_t y);

void dctx_image_raster(DCtx *ctx, const Image *image, real32_t x, real32_t y);

void dctx_set_default_osfont(DCtx *ctx, const void *font);

void dctx_data_imp(DCtx *ctx, void *data, FPtr_destroy func_destroy_data);

void *dctx_get_data_imp(const DCtx *ctx);

void draw_lineimp(DCtx *ctx, real32_t x0, real32_t y0, real32_t x1, real32_t y1, bool_t raster);


void dctx_data(T)(DCtx *ctx, T* data, void function(T**) func_destroy_data) {
    dctx_data_imp(ctx, data, cast(FPtr_destroy)func_destroy_data);
}

T* dctx_get_data(T)(DCtx *ctx) {
    return cast(T*)dctx_get_data_imp(ctx);
}
