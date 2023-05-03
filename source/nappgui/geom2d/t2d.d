/** 
 * 2D affine transformations
 * 
 * See_Also: https://nappgui.com/en/geom2d/t2d.html
 */
module nappgui.geom2d.t2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void t2d_tof(T2Df *dest, const T2Dd *src);

void t2d_tod(T2Dd *dest, const T2Df *src);

void t2d_movef(T2Df *dest, const T2Df *src, real32_t x, real32_t y);

void t2d_moved(T2Dd *dest, const T2Dd *src, real64_t x, real64_t y);

void t2d_rotatef(T2Df *dest, const T2Df *src, real32_t angle);

void t2d_rotated(T2Dd *dest, const T2Dd *src, real64_t angle);

void t2d_scalef(T2Df *dest, const T2Df *src, real32_t sx, real32_t sy);

void t2d_scaled(T2Dd *dest, const T2Dd *src, real64_t sx, real64_t sy);

void t2d_invfastf(T2Df *dest, const T2Df *src);

void t2d_invfastd(T2Dd *dest, const T2Dd *src);

void t2d_inversef(T2Df *dest, const T2Df *src);

void t2d_inversed(T2Dd *dest, const T2Dd *src);

void t2d_multf(T2Df *dest, const T2Df *src1, const T2Df *src2);

void t2d_multd(T2Dd *dest, const T2Dd *src1, const T2Dd *src2);

void t2d_vmultf(V2Df *dest, const T2Df *t2d, const V2Df *src);

void t2d_vmultd(V2Dd *dest, const T2Dd *t2d, const V2Dd *src);

void t2d_vmultnf(V2Df *dest, const T2Df *t2d, const V2Df *src, uint32_t n);

void t2d_vmultnd(V2Dd *dest, const T2Dd *t2d, const V2Dd *src, uint32_t n);

void t2d_decomposef(const T2Df *t2d, V2Df *pos, real32_t *angle, V2Df *sc);

void t2d_decomposed(const T2Dd *t2d, V2Dd *pos, real64_t *angle, V2Dd *sc);

extern export __gshared {
    const T2Df *kT2D_IDENTf;
    const T2Dd *kT2D_IDENTd;
}

extern(C++)
struct T2D(F)
{
    static void function(T2D!F *dest, const T2D!F *src, F x, F y) move;

    static void function(T2D!F *dest, const T2D!F *src, F angle) rotate;

    static void function(T2D!F *dest, const T2D!F *src, F sx, F sy) scale;

    static void function(T2D!F *dest, const T2D!F *src) invfast;

    static void function(T2D!F *dest, const T2D!F *src) inverse;

    static void function(T2D!F *dest, const T2D!F *src1, const T2D!F *src2) mult;

    static void function(V2D!F *dest, const T2D!F *t2d, const V2D!F *src) vmult;

    static void function(V2D!F *dest, const T2D!F *t2d, const V2D!F *src, uint32_t n) vmultn;

    static void function(const T2D!F *t2d, V2D!F *pos, F *angle, V2D!F *sc) decompose;

    static const(T2D!F) *kIDENT;

    V2D!F i;
    V2D!F j;
    V2D!F p;
}