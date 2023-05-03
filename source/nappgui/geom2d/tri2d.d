/** 
 * 2d triangles
 * 
 * See_Also: https://nappgui.com/en/geom2d/tri2d.html
 */
module nappgui.geom2d.tri2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Tri2Df tri2df(real32_t x0, real32_t y0, real32_t x1, real32_t y1, real32_t x2, real32_t y2);

Tri2Dd tri2dd(real64_t x0, real64_t y0, real64_t x1, real64_t y1, real64_t x2, real64_t y2);

Tri2Df tri2d_vf(const V2Df *p0, const V2Df *p1, const V2Df *p2);

Tri2Dd tri2d_vd(const V2Dd *p0, const V2Dd *p1, const V2Dd *p2);

void tri2d_transformf(Tri2Df *tri, const T2Df *t2d);

void tri2d_transformd(Tri2Dd *tri, const T2Dd *t2d);

real32_t tri2d_areaf(const Tri2Df *tri);

real64_t tri2d_aread(const Tri2Dd *tri);

bool_t tri2d_ccwf(const Tri2Df *tri);

bool_t tri2d_ccwd(const Tri2Dd *tri);

V2Df tri2d_centroidf(const Tri2Df *tri);

V2Dd tri2d_centroidd(const Tri2Dd *tri);

extern(C++)
struct Tri2D(F)
{

    this(F x0, F y0, F x1, F y1, F x2, F y2) {
        p0.x = x0, p0.y = y0, p1.x = x1, p1.y = y1, p2.x = x2, p2.y = y2;
    }

    this(const V2D!F *_p0, const V2D!F *_p1, const V2D!F *_p2) {
        p0 = *_p0, p1 = *_p1, p2 = *_p2;
    }

    static void function(Tri2D!F *tri, const T2D!F *t2d) transform;

    static F function(const Tri2D!F *tri) area;

    static bool_t function(const Tri2D!F *tri) ccw;

    static V2D!F function(const Tri2D!F *tri) centroid;

    V2D!F p0 = V2D!F(0, 0);
    V2D!F p1 = V2D!F(0, 0);
    V2D!F p2 = V2D!F(0, 0);
}
