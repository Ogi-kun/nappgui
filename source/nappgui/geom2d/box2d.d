/** 
 * Box 2d
 * 
 * See_Also: https://nappgui.com/en/geom2d/box2d.html
 */
module nappgui.geom2d.box2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Box2Df box2df(real32_t minX, real32_t minY, real32_t maxX, real32_t maxY);

Box2Dd box2dd(real64_t minX, real64_t minY, real64_t maxX, real64_t maxY);

Box2Df box2d_from_pointsf(const V2Df *p, uint32_t n);

Box2Dd box2d_from_pointsd(const V2Dd *p, uint32_t n);

V2Df box2d_centerf(const Box2Df *box);

V2Dd box2d_centerd(const Box2Dd *box);

void box2d_addf(Box2Df *box, const V2Df *p);

void box2d_addd(Box2Dd *box, const V2Dd *p);

void box2d_addnf(Box2Df *box, const V2Df *p, uint32_t n);

void box2d_addnd(Box2Dd *box, const V2Dd *p, uint32_t n);

void box2d_add_circlef(Box2Df *box, const Cir2Df *cir);

void box2d_add_circled(Box2Dd *box, const Cir2Dd *cir);

void box2d_mergef(Box2Df *dest, const Box2Df *src);

void box2d_merged(Box2Dd *dest, const Box2Dd *src);

void box2d_segmentsf(const Box2Df *box, Seg2Df *segs);

void box2d_segmentsd(const Box2Dd *box, Seg2Dd *segs);

real32_t box2d_areaf(const Box2Df *box);

real64_t box2d_aread(const Box2Dd *box);

bool_t box2d_is_nullf(const Box2Df *box);

bool_t box2d_is_nulld(const Box2Dd *box);

extern export __gshared {
    const Box2Df kBOX2D_NULLf;
    const Box2Dd kBOX2D_NULLd;
}

extern(C++)
struct Box2D(F)
{

    this(F minX, F minY, F maxX, F maxY) {
        min.x = minX, min.y = minY, max.x = maxX, max.y = maxY;
    }

    static {
        Box2D!F function(const V2D!F *p, uint32_t n) from_points;

        V2D!F function(const Box2D!F *box) center;

        void function(Box2D!F *box, const V2D!F *p) add;

        void function(Box2D!F *box, const V2D!F *p, uint32_t n) addn;

        void function(Box2D!F *dest, const Box2D!F *src) merge;

        void function(const Box2D!F *box, Seg2D!F *segs) segments;

        F function(const Box2D!F *box) area;

        bool_t function(const Box2D!F *box) is_null;

        const(Box2D!F)* kNULL;
    }

    V2D!F min = V2D!F(F.max, F.max);
    V2D!F max = V2D!F(F.min, F.min);
}

extern(C++)
struct Box2D2(F1, F2)
{
    static void function(Box2D!F1 *dest, const Box2D!F2 *src) copy;
}

