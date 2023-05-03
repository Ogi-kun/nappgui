/** 
 * 2d segments
 * 
 * See_Also: https://nappgui.com/en/geom2d/seg2d.html
 */
module nappgui.geom2d.seg2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Seg2Df seg2df(real32_t x0, real32_t y0, real32_t x1, real32_t y1);

Seg2Dd seg2dd(real64_t x0, real64_t y0, real64_t x1, real64_t y1);

Seg2Df seg2d_vf(const V2Df *p0, const V2Df *p1);

Seg2Dd seg2d_vd(const V2Dd *p0, const V2Dd *p1);

real32_t seg2d_lengthf(const Seg2Df *seg);

real64_t seg2d_lengthd(const Seg2Dd *seg);

real32_t seg2d_sqlengthf(const Seg2Df *seg);

real64_t seg2d_sqlengthd(const Seg2Dd *seg);

V2Df seg2d_evalf(const Seg2Df *seg, real32_t t);

V2Dd seg2d_evald(const Seg2Dd *seg, real64_t t);

real32_t seg2d_close_paramf(const Seg2Df *seg, const V2Df *pnt);

real64_t seg2d_close_paramd(const Seg2Dd *seg, const V2Dd *pnt);

real32_t seg2d_point_sqdistf(const Seg2Df *seg, const V2Df *pnt, real32_t *t);

real64_t seg2d_point_sqdistd(const Seg2Dd *seg, const V2Dd *pnt, real64_t *t);

real32_t seg2d_sqdistf(const Seg2Df *seg1, const Seg2Df *seg2, real32_t *t1, real32_t *t2);

real64_t seg2d_sqdistd(const Seg2Dd *seg1, const Seg2Dd *seg2, real64_t *t1, real64_t *t2);

extern(C++)
struct Seg2D(F)
{

    this(F x0, F y0, F x1, F y1) {
        p0.x = x0, p0.y = y0, p1.x = x1, p1.y = y1;
    }

    this(const V2D!F *_p0, const V2D!F *_p1) {
        p0 = *_p0, p1 = *_p1;
    }

    static F function(const Seg2D!F *seg) length;

    static F function(const Seg2D!F *seg) sqlength;

    static V2D!F function(const Seg2D!F *seg, F t) eval;

    static F function(const Seg2D!F *seg, const V2D!F *pnt) close_param;

    static F function(const Seg2D!F *seg, const V2D!F *pnt, F *t) point_sqdist;

    static F function(const Seg2D!F *seg1, const Seg2D!F *seg2, F*, F*) sqdist;

    V2D!F p0 = V2D!F(0, 0);
    V2D!F p1 = V2D!F(0, 0);
}