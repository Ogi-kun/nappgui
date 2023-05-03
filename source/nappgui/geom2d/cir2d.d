/** 
 * Circle 2d
 * 
 * See_Also: https://nappgui.com/en/geom2d/cir2d.html
 */
module nappgui.geom2d.cir2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Cir2Df cir2df(real32_t x, real32_t y, real32_t r);

Cir2Dd cir2dd(real64_t x, real64_t y, real64_t r);

Cir2Df cir2d_from_boxf(const Box2Df *box);

Cir2Dd cir2d_from_boxd(const Box2Dd *box);

Cir2Df cir2d_from_pointsf(const V2Df *p, uint32_t n);

Cir2Dd cir2d_from_pointsd(const V2Dd *p, uint32_t n);

Cir2Df cir2d_minimumf(const V2Df *p, uint32_t n);

Cir2Dd cir2d_minimumd(const V2Dd *p, uint32_t n);

real32_t cir2d_areaf(const Cir2Df *cir);

real64_t cir2d_aread(const Cir2Dd *cir);

bool_t cir2d_is_nullf(const Cir2Df *cir);

bool_t cir2d_is_nulld(const Cir2Dd *cir);

extern export __gshared {
    const Cir2Df kCIR2D_NULLf;
    const Cir2Dd kCIR2D_NULLd;
}

import nappgui.geom2d.box2d;
import nappgui.geom2d.v2d;

extern(C++)
struct Cir2D(F) {
    this(F x, F y, F r) {
        c.x = x;
        c.y = y; 
        this.r = r;
    }

    static {
        Cir2D!F function(const Box2D!F *box) from_box;
        Cir2D!F function(const V2D!F *p, uint32_t n) from_points;
        Cir2D!F function(const V2D!F *p, uint32_t n) minimum;
        F function(const Cir2D!F *cir) area;
        bool_t function(const Cir2D!F *cir) is_null;
        const(Cir2D!F)* kNULL;
    }

    V2D!F c = V2D!F(0, 0);
    F r = 0;
}
