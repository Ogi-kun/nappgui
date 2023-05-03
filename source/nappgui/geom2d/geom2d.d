/** 
 * 2d geometry
 * 
 * See_Also: https://nappgui.com/en/geom2d/geom2d.html
 */
module nappgui.geom2d.geom2d;

import nappgui.sewer.types;

extern(C) @nogc nothrow:

struct OBB2Df;
struct OBB2Dd;
struct Pol2Df;
struct Pol2Dd;

struct V2Df
{
    real32_t x;
    real32_t y;
}

struct V2Dd
{
    real64_t x;
    real64_t y;
}

struct S2Df
{
    real32_t width;
    real32_t height;
}

struct S2Dd
{
    real64_t width;
    real64_t height;
}

struct R2Df
{
    V2Df pos;
    S2Df size;
}

struct R2Dd
{
    V2Dd pos;
    S2Dd size;
}

struct T2Df
{
    V2Df i;
    V2Df j;
    V2Df p;
}

struct T2Dd
{
    V2Dd i;
    V2Dd j;
    V2Dd p;
}


struct Seg2Df
{
    V2Df p0;
    V2Df p1;
}

struct Seg2Dd
{
    V2Dd p0;
    V2Dd p1;
}

struct Cir2Df
{
    V2Df c;
    real32_t r;
}

struct Cir2Dd
{
    V2Dd c;
    real64_t r;
}

struct Box2Df
{
    V2Df min;
    V2Df max;
}

struct Box2Dd
{
    V2Dd min;
    V2Dd max;
}


struct Tri2Df
{
    V2Df p0;
    V2Df p1;
    V2Df p2;
}

struct Tri2Dd
{
    V2Dd p0;
    V2Dd p1;
    V2Dd p2;
}

struct Col2Df
{
    V2Df p;
    V2Df n;
    real32_t d;
}

struct Col2Dd
{
    V2Dd p;
    V2Dd n;
    real64_t d;
}
