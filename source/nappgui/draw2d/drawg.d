/** 
 * Drawing 2D Geometry entities
 * 
 * See_Also: https://nappgui.com/en/draw2d/drawg.html
 */
module nappgui.draw2d.drawg;

import nappgui.geom2d.cir2d;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.geom2d.obb2d;
import nappgui.geom2d.pol2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void draw_v2df(DCtx *ctx, drawop_t op, const V2Df *v2d, real32_t radius);

void draw_v2dd(DCtx *ctx, drawop_t op, const V2Dd *v2d, real64_t radius);

void draw_seg2df(DCtx *ctx, const Seg2Df *seg);

void draw_seg2dd(DCtx *ctx, const Seg2Dd *seg);

void draw_cir2df(DCtx *ctx, drawop_t op, const Cir2Df *cir);

void draw_cir2dd(DCtx *ctx, drawop_t op, const Cir2Dd *cir);

void draw_box2df(DCtx *ctx, drawop_t op, const Box2Df *box);

void draw_box2dd(DCtx *ctx, drawop_t op, const Box2Dd *box);

void draw_obb2df(DCtx *ctx, drawop_t op, const OBB2Df *obb);

void draw_obb2dd(DCtx *ctx, drawop_t op, const OBB2Dd *obb);

void draw_tri2df(DCtx *ctx, drawop_t op, const Tri2Df *tri);

void draw_tri2dd(DCtx *ctx, drawop_t op, const Tri2Dd *tri);

void draw_pol2df(DCtx *ctx, drawop_t op, const Pol2Df *pol);

void draw_pol2dd(DCtx *ctx, drawop_t op, const Pol2Dd *pol);

extern(C++)
struct Draw(F) {
    static {
        void function(DCtx *ctx, drawop_t op, const V2D!F *v2d, const F radius) v2d;
        void function(DCtx *ctx, const Seg2D!F *seg) seg2d;
        void function(DCtx *ctx, drawop_t op, const Cir2D!F *cir) cir2d;
        void function(DCtx *ctx, drawop_t op, const Box2D!F *box) box2d;
        void function(DCtx *ctx, drawop_t op, const OBB2D!F *obb) obb2d;
        void function(DCtx *ctx, drawop_t op, const Tri2D!F *tri) tri2d;
        void function(DCtx *ctx, drawop_t op, const Pol2D!F *pol) pol2d;
    }
}