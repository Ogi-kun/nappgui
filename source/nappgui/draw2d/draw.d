/** 
 * Drawing commands
 * 
 * See_Also: https://nappgui.com/en/draw2d/draw.html
 */
module nappgui.draw2d.draw;

import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void draw_line(DCtx *ctx, real32_t x0, real32_t y0, real32_t x1, real32_t y1);

void draw_polyline(DCtx *ctx, bool_t closed, const V2Df *points, uint32_t n);

void draw_arc(DCtx *ctx, real32_t x, real32_t y, real32_t radius, real32_t start, real32_t sweep);

void draw_bezier(DCtx *ctx, real32_t x0, real32_t y0, real32_t x1, real32_t y1, real32_t x2, real32_t y2, real32_t x3, real32_t y3);

void draw_line_color(DCtx *ctx, color_t color);

void draw_line_fill(DCtx *ctx);

void draw_line_width(DCtx *ctx, real32_t width);

void draw_line_cap(DCtx *ctx, linecap_t cap);

void draw_line_join(DCtx *ctx, linejoin_t join);

void draw_line_dash(DCtx *ctx, const real32_t *pattern, uint32_t n);

void draw_rect(DCtx *ctx, drawop_t op, real32_t x, real32_t y, real32_t width, real32_t height);

void draw_rndrect(DCtx *ctx, drawop_t op, real32_t x, real32_t y, real32_t width, real32_t height, real32_t radius);

void draw_circle(DCtx *ctx, drawop_t op, real32_t x, real32_t y, real32_t radius);

void draw_ellipse(DCtx *ctx, drawop_t op, real32_t x, real32_t y, real32_t radx, real32_t rady);

void draw_polygon(DCtx *ctx, drawop_t op, const V2Df *points, uint32_t n);

void draw_fill_color(DCtx *ctx, color_t color);

void draw_fill_linear(DCtx *ctx, const color_t *color, const real32_t *stop, uint32_t n, real32_t x0, real32_t y0, real32_t x1, real32_t y1);

void draw_fill_matrix(DCtx *ctx, const T2Df *t2d);

void draw_fill_wrap(DCtx *ctx, fillwrap_t wrap);

void draw_font(DCtx *ctx, const Font *font);

void draw_text_color(DCtx *ctx, color_t color);

void draw_text(DCtx *ctx, const char_t *text, real32_t x, real32_t y);

void draw_text_path(DCtx *ctx, drawop_t op, const char_t *text, real32_t x, real32_t y);

void draw_text_width(DCtx *ctx, real32_t width);

void draw_text_trim(DCtx *ctx, ellipsis_t ellipsis);

void draw_text_align(DCtx *ctx, align_t halign, align_t valign);

void draw_text_halign(DCtx *ctx, align_t halign);

void draw_text_extents(DCtx *ctx, const char_t *text, real32_t refwidth, real32_t *width, real32_t *height);

void draw_image(DCtx *ctx, const Image *image, real32_t x, real32_t y);

void draw_image_frame(DCtx *ctx, const Image *image, uint32_t frame, real32_t x, real32_t y);

void draw_image_align(DCtx *ctx, align_t halign, align_t valign);

