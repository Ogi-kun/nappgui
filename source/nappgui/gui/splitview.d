/** 
 * Split view
 * 
 * See_Also: https://nappgui.com/en/gui/splitview.html
 */
module nappgui.gui.splitview;

import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

SplitView *splitview_horizontal();

SplitView *splitview_vertical();

void splitview_size(SplitView *split, const S2Df size);

void splitview_view(SplitView *split, View *view);

void splitview_text(SplitView *split, TextView *view);

void splitview_split(SplitView *split, SplitView *child);

void splitview_panel(SplitView *split, Panel *panel);

void splitview_pos(SplitView *split, real32_t pos);

