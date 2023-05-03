/** 
 * Operating system 2D drawing support 
 * 
 * See_Also: https://nappgui.com/en/draw2d/draw2d.html
 */
module nappgui.draw2d.draw2d;

import nappgui.config;

import nappgui.sewer.sewer;
import nappgui.sewer.types;
import nappgui.core.core;

extern(C) @nogc nothrow:

void draw2d_start();

void draw2d_finish();

const(Image)* resid_image(const ResId resid) {
    return cast(const Image*)resid;
}

enum pixformat_t
{
    ekINDEX1,
    ekINDEX2,
    ekINDEX4,
    ekINDEX8,
    ekGRAY8,
    ekRGB24,
    ekRGBA32,

    ekFIMAGE
}
mixin ExpandEnum!pixformat_t;


enum codec_t
{
    ekJPG = 1,
    ekPNG,
    ekBMP,
    ekGIF
}
mixin ExpandEnum!codec_t;

enum fstyle_t
{
    ekFNORMAL       = 0,
    ekFBOLD         = 1,
    ekFITALIC       = 2,
    ekFSTRIKEOUT    = 4,
    ekFUNDERLINE    = 8,
    ekFSUBSCRIPT    = 16,
    ekFSUPSCRIPT    = 32,

    ekFPIXELS       = 0,
    ekFPOINTS       = 64
}
mixin ExpandEnum!fstyle_t;

enum linecap_t
{
    ekLCFLAT,
    ekLCSQUARE,
    ekLCROUND
}
mixin ExpandEnum!linecap_t;

enum linejoin_t
{
    ekLJMITER,
    ekLJROUND,
    ekLJBEVEL
}
mixin ExpandEnum!linejoin_t;

enum fillwrap_t
{
    ekFCLAMP,
    ekFTILE,
    ekFFLIP
}
mixin ExpandEnum!fillwrap_t;

enum drawop_t
{
    ekSTROKE = 1,
    ekFILL,
    ekSKFILL,
    ekFILLSK
}
mixin ExpandEnum!drawop_t;

enum align_t
{
    ekLEFT = 1,
    ekTOP = 1,
    ekCENTER = 2,
    ekRIGHT = 3,
    ekBOTTOM = 3,
    ekJUSTIFY = 4
}
mixin ExpandEnum!align_t;

enum ellipsis_t
{
    ekELLIPNONE = 1,
    ekELLIPBEGIN,
    ekELLIPMIDDLE,
    ekELLIPEND,
    ekELLIPMLINE
}
mixin ExpandEnum!ellipsis_t;

enum indicator_t
{
    ekINDNONE = 0,
    ekINDUP_ARROW,
    ekINDDOWN_ARROW
}
mixin ExpandEnum!indicator_t;

alias color_t = uint32_t;

struct DCtx;
struct Palette;
struct Pixbuf;
struct Image;
struct Font;

//DeclSt(color_t);
//DeclPt(Image);

