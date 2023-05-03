/** 
 * Panel
 * 
 * See_Also: https://nappgui.com/en/gui/panel.html
 */
module nappgui.gui.panel;

import nappgui.core.core;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Panel *panel_create();

Panel *panel_scroll(bool_t hscroll, bool_t vscroll);

void panel_data_imp(Panel *panel, void **data, FPtr_destroy func_destroy_data);

void *panel_get_data_imp(const Panel *panel);

void panel_size(Panel *panel, const S2Df size);

uint32_t panel_layout(Panel *panel, Layout *layout);

Layout *panel_get_layout(Panel *panel, uint32_t index);

void panel_visible_layout(Panel *panel, uint32_t index);

void panel_update(Panel *panel);

real32_t panel_scroll_width(const Panel *panel);

real32_t panel_scroll_height(const Panel *panel);

void panel_data(T)(Panel *panel, T** data, void function(T**)) {
    panel_data_imp(panel, cast(void**)data, cast(FPtr_destroy)func_destroy_data);
}

T* panel_get_data(T)(Panel *panel) {
    return cast(T*)panel_get_data_imp(panel);
}


