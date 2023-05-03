/** 
 * Custom view
 * 
 * See_Also: https://nappgui.com/en/gui/view.html
 */
module nappgui.gui.view;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

View *view_create();

View *view_scroll();

void view_data_imp(View *view, void **data, FPtr_destroy func_destroy_data);

void *view_get_data_imp(const View *view);

void view_size(View *view, const S2Df size);

void view_OnDraw(View *view, Listener *listener);

void view_OnOverlay(View *view, Listener *listener);

void view_OnSize(View *view, Listener *listener);

void view_OnEnter(View *view, Listener *listener);

void view_OnExit(View *view, Listener *listener);

void view_OnMove(View *view, Listener *listener);

void view_OnDown(View *view, Listener *listener);

void view_OnUp(View *view, Listener *listener);

void view_OnClick(View *view, Listener *listener);

void view_OnDrag(View *view, Listener *listener);

void view_OnWheel(View *view, Listener *listener);

void view_OnKeyDown(View *view, Listener *listener);

void view_OnKeyUp(View *view, Listener *listener);

void view_OnFocus(View *view, Listener *listener);

void view_keybuf(View *view, KeyBuf *buffer);

void view_get_size(const View *view, S2Df *size);

void view_content_size(View *view, const S2Df size, const S2Df line);

void view_scroll_x(View *view, real32_t pos);

void view_scroll_y(View *view, real32_t pos);

void view_scroll_size(const View *view, real32_t *width, real32_t *height);

void view_viewport(const View *view, V2Df *pos, S2Df *size);

void view_point_scale(const View *view, real32_t *scale);

void view_update(View *view);

void *view_native(View *view);


void view_data(T)(View *view, T** data, void function(T**) func_destroy_data) {
    view_data_imp(view, cast(void**)data, cast(FPtr_destroy)func_destroy_data);
}

T* view_get_data(T)(View *view) {
    return cast(T*)view_get_data_imp(view);
}

