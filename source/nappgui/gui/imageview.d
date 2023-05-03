/** 
 * Image view
 * 
 * See_Also: https://nappgui.com/en/gui/imageview.html
 */
module nappgui.gui.imageview;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

ImageView *imageview_create();

void imageview_size(ImageView *view, S2Df size);

void imageview_scale(ImageView *view, gui_scale_t scale);

void imageview_image(ImageView *view, const Image *image);

void imageview_OnClick(ImageView *view, Listener *listener);

void imageview_OnOverDraw(ImageView *view, Listener *listener);
