/** 
 * TableView
 * 
 * See_Also: https://nappgui.com/en/gui/tableview.html
 */
module nappgui.gui.tableview;

import nappgui.core.arrst;
import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

TableView *tableview_create();

void tableview_OnData(TableView *view, Listener *listener);

void tableview_OnSelect(TableView *view, Listener *listener);

void tableview_OnHeaderClick(TableView *view, Listener *listener);

void tableview_font(TableView *view, const Font *font);

void tableview_size(TableView *view, S2Df size);

uint32_t tableview_new_column_text(TableView *view);

void tableview_column_width(TableView *view, uint32_t column_id, real32_t width);

void tableview_column_limits(TableView *view, uint32_t column_id, real32_t min, real32_t max);

void tableview_column_resizable(TableView *view, uint32_t column_id, bool_t resizable);

void tableview_column_freeze(TableView *view, uint32_t last_column_id);

void tableview_header_title(TableView *view, uint32_t column_id, const char_t *text);

void tableview_header_align(TableView *view, uint32_t column_id, align_t align_);

void tableview_header_indicator(TableView *view, uint32_t column_id, uint32_t indicator);

void tableview_header_visible(TableView *view, bool_t visible);

void tableview_header_clickable(TableView *view, bool_t clickable);

void tableview_header_resizable(TableView *view, bool_t resizable);

void tableview_multisel(TableView *view, bool_t multisel, bool_t preserve);

void tableview_grid(TableView *view, bool_t hlines, bool_t vlines);

void tableview_update(TableView *view);

void tableview_select(TableView *view, const uint32_t *rows, uint32_t n);

void tableview_deselect(TableView *view, const uint32_t *rows, uint32_t n);

void tableview_deselect_all(TableView *view);

const(ArrSt!uint32_t) *tableview_selected(const TableView *view);


