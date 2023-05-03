/** 
 * 2d polygon
 * 
 * See_Also: https://nappgui.com/en/geom2d/pol2d.html
 */
module nappgui.geom2d.pol2d;


import nappgui.core.arrst;
import nappgui.core.arrpt;
import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Pol2Df* pol2d_createf(const V2Df *points, uint32_t n);

Pol2Dd* pol2d_created(const V2Dd *points, uint32_t n);

Pol2Df* pol2d_convex_hullf(const V2Df *points, uint32_t n);

Pol2Dd* pol2d_convex_hulld(const V2Dd *points, uint32_t n);

Pol2Df* pol2d_copyf(const Pol2Df *pol);

Pol2Dd* pol2d_copyd(const Pol2Dd *pol);

void pol2d_destroyf(Pol2Df **pol);

void pol2d_destroyd(Pol2Dd **pol);

void pol2d_transformf(Pol2Df *pol, const T2Df *t2d);

void pol2d_transformd(Pol2Dd *pol, const T2Dd *t2d);

const (V2Df) *pol2d_pointsf(const Pol2Df *pol);

const (V2Dd) *pol2d_pointsd(const Pol2Dd *pol);

uint32_t pol2d_nf(const Pol2Df *pol);

uint32_t pol2d_nd(const Pol2Dd *pol);

real32_t pol2d_areaf(const Pol2Df *pol);

real64_t pol2d_aread(const Pol2Dd *pol);

Box2Df pol2d_boxf(const Pol2Df *pol);

Box2Dd pol2d_boxd(const Pol2Dd *pol);

bool_t pol2d_ccwf(const Pol2Df *pol);

bool_t pol2d_ccwd(const Pol2Dd *pol);

bool_t pol2d_convexf(const Pol2Df *pol);

bool_t pol2d_convexd(const Pol2Dd *pol);

V2Df pol2d_centroidf(const Pol2Df *pol);

V2Dd pol2d_centroidd(const Pol2Dd *pol);

V2Df pol2d_visual_centerf(const Pol2Df *pol, real32_t norm_tol);

V2Dd pol2d_visual_centerd(const Pol2Dd *pol, real64_t norm_tol);


ArrSt!Tri2Df *pol2d_trianglesf(const Pol2Df *pol);

ArrSt!Tri2Dd *pol2d_trianglesd(const Pol2Dd *pol);

ArrPt!Pol2Df *pol2d_convex_partitionf(const Pol2Df *pol);

ArrPt!Pol2Dd *pol2d_convex_partitiond(const Pol2Dd *pol);

extern(C++)
struct Pol2D(F)
{
    static Pol2D!F* function(const V2D!F *points, uint32_t n) create;

    static Pol2D!F* function(const V2D!F *points, uint32_t n) convex_hull;

    static Pol2D!F* function(const Pol2D!F *pol) copy;

    static void function(Pol2D!F **pol) destroy;

    static void function(Pol2D!F *pol, const T2D!F *t2d) transform;

    static const(V2D!F)* function(const Pol2D!F *pol) points;

    static uint32_t function(const Pol2D!F *pol) n;

    static F function(const Pol2D!F *pol) area;

    static Box2D!F function(const Pol2D!F *pol) box;

    static bool_t function(const Pol2D!F *pol) ccw;

    static bool_t function(const Pol2D!F *pol) convex;

    static V2D!F function(const Pol2D!F *pol) centroid;

    static V2D!F function(const Pol2D!F *pol, const F tol) visual_center;

    static ArrSt!(Tri2D!F)* function(const Pol2D!F *pol) triangles;

    static ArrPt!(Pol2D!F)* function(const Pol2D!F *pol) convex_partition;
}