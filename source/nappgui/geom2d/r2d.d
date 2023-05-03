/** 
 * 2d rectangles
 * 
 * See_Also: https://nappgui.com/en/geom2d/r2d.html
 */
module nappgui.geom2d.r2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

R2Df r2df(real32_t x, real32_t y, real32_t width, real32_t height);

R2Dd r2dd(real64_t x, real64_t y, real64_t width, real64_t height);

V2Df r2d_centerf(const R2Df* r2d);

V2Dd r2d_centerd(const R2Dd* r2d);

bool_t r2d_collidef(const R2Df *r2d1, const R2Df *r2d2);

bool_t r2d_collided(const R2Dd *r2d1, const R2Dd *r2d2);

bool_t r2d_containsf(const R2Df *r2d, real32_t x, real32_t y);

bool_t r2d_containsd(const R2Dd *r2d, real64_t x, real64_t y);

bool_t r2d_clipf(const R2Df *viewport, const R2Df *r2d);

bool_t r2d_clipd(const R2Dd *viewport, const R2Dd *r2d);

void r2d_joinf(R2Df *r2d, const R2Df *src);

void r2d_joind(R2Dd *r2d, const R2Dd *src);

extern export __gshared {
    const R2Df kR2D_ZEROf;
    const R2Dd kR2D_ZEROd;
}

extern(C++)
struct R2D(F)
{
    this(F x, F y, F width, F height) {
        pos.x = x, pos.y = y, size.width = width, size.height = height;
    }

    static V2D!F function(const R2D* r2d) center;

    static bool_t function(const R2D *r2d1, const R2D *r2d2) collide;

    static bool_t function(const R2D *r2d, F x, F y) contains;

    static bool_t function(const R2D *viewport, const R2D *r2d) clip;

    static void function(R2D *r2d, const R2D *src) join;

    static const R2D!F *kZERO;

    V2D!F pos = V2D!F(0, 0);
    S2D!F size = S2D!F(0, 0);
}
