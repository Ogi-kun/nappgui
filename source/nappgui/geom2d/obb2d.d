/** 
 * Oriented Box 2d
 * 
 * See_Also: https://nappgui.com/en/geom2d/obb2d.html
 */
module nappgui.geom2d.obb2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

OBB2Df* obb2d_createf(const V2Df *center, real32_t width, real32_t height, real32_t angle);

OBB2Dd* obb2d_created(const V2Dd *center, real64_t width, real64_t height, real64_t angle);

OBB2Df* obb2d_from_linef(const V2Df *p0, const V2Df *p1, real32_t thickness);

OBB2Dd* obb2d_from_lined(const V2Dd *p0, const V2Dd *p1, real64_t thickness);

OBB2Df* obb2d_from_pointsf(const V2Df *p, uint32_t n);

OBB2Dd* obb2d_from_pointsd(const V2Dd *p, uint32_t n);

OBB2Df* obb2d_copyf(const OBB2Df *obb);

OBB2Dd* obb2d_copyd(const OBB2Dd *obb);

void obb2d_destroyf(OBB2Df **obb);

void obb2d_destroyd(OBB2Dd **obb);

void obb2d_updatef(OBB2Df *obb, const V2Df *center, real32_t width, real32_t height, real32_t angle);

void obb2d_updated(OBB2Dd *obb, const V2Dd *center, real64_t width, real64_t height, real64_t angle);

void obb2d_movef(OBB2Df *obb, real32_t offset_x, real32_t offset_y);

void obb2d_moved(OBB2Dd *obb, real64_t offset_x, real64_t offset_y);

void obb2d_transformf(OBB2Df *obb, const T2Df *t2d);

void obb2d_transformd(OBB2Dd *obb, const T2Dd *t2d);

const(V2Df) *obb2d_cornersf(const OBB2Df *obb);

const(V2Dd) *obb2d_cornersd(const OBB2Dd *obb);

V2Df obb2d_centerf(const OBB2Df *obb);

V2Dd obb2d_centerd(const OBB2Dd *obb);

real32_t obb2d_widthf(const OBB2Df *obb);

real64_t obb2d_widthd(const OBB2Dd *obb);

real32_t obb2d_heightf(const OBB2Df *obb);

real64_t obb2d_heightd(const OBB2Dd *obb);

real32_t obb2d_anglef(const OBB2Df *obb);

real64_t obb2d_angled(const OBB2Dd *obb);

real32_t obb2d_areaf(const OBB2Df *obb);

real64_t obb2d_aread(const OBB2Dd *obb);

Box2Df obb2d_boxf(const OBB2Df *obb);

Box2Dd obb2d_boxd(const OBB2Dd *obb);

struct OBB2D(F)
{
    static OBB2D!F* function(const V2D!F *center, const F width, const F height, const F angle) create;

    static OBB2D!F* function(const V2D!F *p0, const V2D!F *p1, const F thickness) from_line;

    static OBB2D!F* function(const V2D!F *p, uint32_t n) from_points;

    static OBB2D!F* function(const OBB2D!F *obb) copy;

    static void function(OBB2D!F **obb) destroy;

    static void function(OBB2D!F *obb, const V2D!F *center, const F width, const F height, const F angle) update;

    static void function(OBB2D!F *obb, const F offset_x, const F offset_y) move;

    static void function(OBB2D!F *obb, const T2D!F *t2d) transform;

    static const(V2D!F)* function(const OBB2D!F *obb) corners;

    static V2D!F function(const OBB2D!F *obb) center;

    static F function(const OBB2D!F *obb) width;

    static F function(const OBB2D!F *obb) height;

    static F function(const OBB2D!F *obb) angle;

    static F function(const OBB2D!F *obb) area;

    static Box2D!F function(const OBB2D!F *obb) box;
}
