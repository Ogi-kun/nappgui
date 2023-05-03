/** 
 * Size 2d 
 * 
 * See_Also: https://nappgui.com/en/geom2d/s2d.html
 */
module nappgui.geom2d.s2d;

import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

S2Df s2df(real32_t width, real32_t height);

S2Df s2di(uint32_t width, uint32_t height);

S2Dd s2dd(real64_t width, real64_t height);

extern export __gshared {
    const S2Df kS2D_ZEROf;
    const S2Dd kS2D_ZEROd;
}


extern(C++)
struct S2D(F)
{

    this(F _width, F _height) {
        width = _width, height = _height;
    }

    static const S2D!F *kZERO;

    F width = 0;
    F height = 0;
}
