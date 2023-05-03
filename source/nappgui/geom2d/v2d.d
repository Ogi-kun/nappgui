/** 
 * Vector 2d
 * 
 * See_Also: https://nappgui.com/en/geom2d/v2d.html
 */
module nappgui.geom2d.v2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

V2Df v2df(real32_t x, real32_t y);

V2Dd v2dd(real64_t x, real64_t y);

V2Df v2d_tof(const V2Dd *v);

V2Dd v2d_tod(const V2Df *v);

void v2d_tofn(V2Df *vf, const V2Dd *vd, uint32_t n);

void v2d_todn(V2Dd *vd, const V2Df *vf, uint32_t n);

V2Df v2d_addf(const V2Df *v1, const V2Df *v2);

V2Dd v2d_addd(const V2Dd *v1, const V2Dd *v2);

V2Df v2d_subf(const V2Df *v1, const V2Df *v2);

V2Dd v2d_subd(const V2Dd *v1, const V2Dd *v2);

V2Df v2d_mulf(const V2Df *v, real32_t s);

V2Dd v2d_muld(const V2Dd *v, real64_t s);

V2Df v2d_fromf(const V2Df *v, const V2Df *dir, real32_t length);

V2Dd v2d_fromd(const V2Dd *v, const V2Dd *dir, real64_t length);

V2Df v2d_midf(const V2Df *v1, const V2Df *v2);

V2Dd v2d_midd(const V2Dd *v1, const V2Dd *v2);

V2Df v2d_unitf(const V2Df *v1, const V2Df *v2, real32_t *dist);

V2Dd v2d_unitd(const V2Dd *v1, const V2Dd *v2, real64_t *dist);

V2Df v2d_unit_xyf(real32_t x1, real32_t y1, real32_t x2, real32_t y2, real32_t *dist);

V2Dd v2d_unit_xyd(real64_t x1, real64_t y1, real64_t x2, real64_t y2, real64_t *dist);

V2Df v2d_perp_posf(const V2Df *v);

V2Dd v2d_perp_posd(const V2Dd *v);

V2Df v2d_perp_negf(const V2Df *v);

V2Dd v2d_perp_negd(const V2Dd *v);

V2Df v2d_from_anglef(real32_t a);

V2Dd v2d_from_angled(real64_t a);

bool_t v2d_normf(V2Df *v);

bool_t v2d_normd(V2Dd *v);

real32_t v2d_lengthf(const V2Df *v);

real64_t v2d_lengthd(const V2Dd *v);

real32_t v2d_sqlengthf(const V2Df *v);

real64_t v2d_sqlengthd(const V2Dd *v);

real32_t v2d_dotf(const V2Df *v1, const V2Df *v2);

real64_t v2d_dotd(const V2Dd *v1, const V2Dd *v2);

real32_t v2d_distf(const V2Df *v1, const V2Df *v2);

real64_t v2d_distd(const V2Dd *v1, const V2Dd *v2);

real32_t v2d_sqdistf(const V2Df *v1, const V2Df *v2);

real64_t v2d_sqdistd(const V2Dd *v1, const V2Dd *v2);

real32_t v2d_anglef(const V2Df *v1, const V2Df *v2);

real64_t v2d_angled(const V2Dd *v1, const V2Dd *v2);

void v2d_rotatef(V2Df *v, real32_t a);

void v2d_rotated(V2Dd *v, real64_t a);

extern export __gshared {
    const V2Df kV2D_ZEROf;
    const V2Dd kV2D_ZEROd;
    const V2Df kV2D_Xf;
    const V2Dd kV2D_Xd;
    const V2Df kV2D_Yf;
    const V2Dd kV2D_Yd;
}

extern(C++)
struct V2D(F)
{

    this(F x, F y) {
        this.x = x; 
        this.y = y;
    }

    static {
        V2D!F function(const V2D!F *v1, const V2D!F *v2) add;

        V2D!F function(const V2D!F *v1, const V2D!F *v2) sub;

        V2D!F function(const V2D!F *v, F s) mul;

        V2D!F function(const V2D!F *v, const V2D!F *dir, F length) from;

        V2D!F function(const V2D!F *v1, const V2D!F *v2) mid;

        V2D!F function(const V2D!F *v1, const V2D!F *v2, F *dist) unit;

        V2D!F function(F x1, F y1, F x2, F y2, F *dist) unit_xy;

        V2D!F function(const V2D!F *v) perp_pos;

        V2D!F function(const V2D!F *v) perp_neg;

        V2D!F function(F a) from_angle;

        bool_t function(V2D!F *v) norm;

        F function(const V2D!F *v) length;

        F function(const V2D!F *v) sqlength;

        F function(const V2D!F *v1, const V2D!F *v2) dot;

        F function(const V2D!F *v1, const V2D!F *v2) dist;

        F function(const V2D!F *v1, const V2D!F *v2) sqdist;

        F function(const V2D!F *v1, const V2D!F *v2) angle;

        void function(V2D!F *v, F a) rotate;

        const(V2D!F)* kZERO;
        const(V2D!F)* kX;
        const(V2D!F)* kY;
    }

    F x = 0;
    F y = 0;
}