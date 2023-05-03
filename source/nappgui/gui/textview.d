/** 
 * Text view
 * 
 * See_Also: https://nappgui.com/en/gui/textview.html
 */
module nappgui.gui.textview;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

TextView *textview_create();

void textview_size(TextView *view, const S2Df size);

void textview_clear(TextView *view);

uint32_t textview_printf(TextView *view, const char_t *format, ...);

void textview_writef(TextView *view, const char_t *text);

void textview_rtf(TextView *view, Stream *rtf_in);

void textview_units(TextView *view, uint32_t units);

void textview_family(TextView *view, const char_t *family);

void textview_fsize(TextView *view, real32_t size);

void textview_fstyle(TextView *view, uint32_t fstyle);

void textview_color(TextView *view, color_t color);

void textview_bgcolor(TextView *view, color_t color);

void textview_pgcolor(TextView *view, color_t color);

void textview_halign(TextView *view, align_t align_);

void textview_lspacing(TextView *view, real32_t scale);

void textview_bfspace(TextView *view, real32_t space);

void textview_afspace(TextView *view, real32_t space);

void textview_scroll_down(TextView *view);

void textview_editable(TextView *view, bool_t is_editable);

