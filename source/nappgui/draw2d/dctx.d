/** 
 * Draw context
 * 
 * See_Also: https://nappgui.com/en/draw2d/dctx.html
 */
module nappgui.draw2d.dctx;

import nappgui.sewer.types;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;

extern(C) @nogc nothrow:

DCtx *dctx_bitmap(uint32_t width, uint32_t height, pixformat_t format);

Image *dctx_image(DCtx **ctx);

void draw_clear(DCtx *ctx, color_t color);

void draw_matrixf(DCtx *ctx, const T2Df *t2d);

void draw_matrixd(DCtx *ctx, const T2Dd *t2d);

void draw_matrix_cartesianf(DCtx *ctx, const T2Df *t2d);

void draw_matrix_cartesiand(DCtx *ctx, const T2Dd *t2d);

void draw_antialias(DCtx *ctx, bool_t on);

