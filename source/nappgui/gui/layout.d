/** 
 * Layouts
 * 
 * See_Also: https://nappgui.com/en/gui/layout.html
 */
module nappgui.gui.layout;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Layout *layout_create(uint32_t ncols, uint32_t nrows);

Cell *layout_cell(Layout *layout, uint32_t col, uint32_t row);

void layout_label(Layout *layout, Label *label, uint32_t col, uint32_t row);

void layout_button(Layout *layout, Button *button, uint32_t col, uint32_t row);

void layout_popup(Layout *layout, PopUp *popup, uint32_t col, uint32_t row);

void layout_edit(Layout *layout, Edit *edit, uint32_t col, uint32_t row);

void layout_combo(Layout *layout, Combo *combo, uint32_t col, uint32_t row);

void layout_listbox(Layout *layout, ListBox *list, uint32_t col, uint32_t row);

void layout_updown(Layout *layout, UpDown *updown, uint32_t col, uint32_t row);

void layout_slider(Layout *layout, Slider *slider, uint32_t col, uint32_t row);

void layout_progress(Layout *layout, Progress *progress, uint32_t col, uint32_t row);

void layout_view(Layout *layout, View *view, uint32_t col, uint32_t row);

void layout_textview(Layout *layout, TextView *view, uint32_t col, uint32_t row);

void layout_imageview(Layout *layout, ImageView *view, uint32_t col, uint32_t row);

void layout_tableview(Layout *layout, TableView *view, uint32_t col, uint32_t row);

void layout_splitview(Layout *layout, SplitView *view, uint32_t col, uint32_t row);

void layout_panel(Layout *layout, Panel *panel, uint32_t col, uint32_t row);

void layout_layout(Layout *layout, Layout *sublayout, uint32_t col, uint32_t row);

void *layout_get_control_imp(Layout *layout, uint32_t col, uint32_t row, const char_t *type);

Layout *layout_get_layout(Layout *layout, uint32_t col, uint32_t row);

void layout_taborder(Layout *layout, gui_orient_t order);

void layout_tabstop(Layout *layout, uint32_t col, uint32_t row, bool_t tabstop);

void layout_hsize(Layout *layout, uint32_t col, real32_t width);

void layout_vsize(Layout *layout, uint32_t row, real32_t height);

void layout_hmargin(Layout *layout, uint32_t col, real32_t margin);

void layout_vmargin(Layout *layout, uint32_t row, real32_t margin);

void layout_hexpand(Layout *layout, uint32_t col);

void layout_hexpand2(Layout *layout, uint32_t col1, uint32_t col2, real32_t exp);

void layout_hexpand3(Layout* layout, uint32_t col1, uint32_t col2, uint32_t col3, real32_t exp1, real32_t exp2);

void layout_vexpand(Layout *layout, uint32_t row);

void layout_vexpand2(Layout* layout, uint32_t row1, uint32_t row2, real32_t exp);

void layout_vexpand3(Layout* layout, uint32_t row1, uint32_t row2, uint32_t row3, real32_t exp1, real32_t exp2);

void layout_halign(Layout *layout, uint32_t col, uint32_t row, align_t align_);

void layout_valign(Layout *layout, uint32_t col, uint32_t row, align_t align_);

void layout_show_col(Layout *layout, uint32_t col, bool_t visible);

void layout_show_row(Layout *layout, uint32_t row, bool_t visible);

void layout_margin(Layout *layout, real32_t mall);

void layout_margin2(Layout *layout, real32_t mtb, real32_t mlr);

void layout_margin4(Layout *layout, real32_t mt, real32_t mr, real32_t mb, real32_t ml);

void layout_bgcolor(Layout *layout, color_t color);

void layout_skcolor(Layout *layout, color_t color);

void layout_update(const Layout *layout);

void layout_dbind_imp(Layout *layout, Listener *listener, const char_t *type, uint16_t size);

void layout_dbind_obj_imp(Layout *layout, void *obj, const char_t *type);

void layout_dbind_update_imp(Layout *layout, const char_t *type, uint16_t size, 
        const char_t *mname, const char_t *mtype, uint16_t moffset, uint16_t msize);


Label* layout_get_label()(Cell *cell) {
    return cast(Label*)cell_control_imp(cell, "Label");
} 

Button* layout_get_button()(Cell *cell) {
    return cast(Button*)cell_control_imp(cell, "Button");
} 

PopUp* layout_get_popup()(Cell *cell) {
    return cast(PopUp*)cell_control_imp(cell, "PopUp");
} 

Edit* layout_get_edit()(Cell *cell) {
    return cast(Edit*)cell_control_imp(cell, "Edit");
} 

Combo* layout_get_combo()(Cell *cell) {
    return cast(Combo*)cell_control_imp(cell, "Combo");
} 

ListBox* layout_get_listbox()(Cell *cell) {
    return cast(ListBox*)cell_control_imp(cell, "ListBox");
} 

UpDown* layout_get_updown()(Cell *cell) {
    return cast(UpDown*)cell_control_imp(cell, "UpDown");
} 

Slider* layout_get_slider()(Cell *cell) {
    return cast(Slider*)cell_control_imp(cell, "Slider");
} 

Progress* layout_get_progress()(Cell *cell) {
    return cast(Progress*)cell_control_imp(cell, "Progress");
} 

View* layout_get_view()(Cell *cell) {
    return cast(View*)cell_control_imp(cell, "View");
} 

TextView* layout_get_textview()(Cell *cell) {
    return cast(TextView*)cell_control_imp(cell, "TextView");
} 

ImageView* layout_get_imageview()(Cell *cell) {
    return cast(ImageView*)cell_control_imp(cell, "ImageView");
} 

TableView* layout_get_tableview()(Cell *cell) {
    return cast(TableView*)cell_control_imp(cell, "TableView");
} 

SplitView* layout_get_splitview()(Cell *cell) {
    return cast(SplitView*)cell_control_imp(cell, "SplitView");
} 

Panel* layout_get_panel()(Cell *cell) {
    return cast(Panel*)cell_control_imp(cell, "Panel");
} 

void layout_dbind(T)(Layout *layout, Listener *listener) {
    layout_dbind_imp(layout, listener, T.stringof, cast(uint16_t)T.sizeof);
}

void layout_dbind_obj(T)(Layout *layout, T* obj) {
    layout_dbind_obj_imp(layout, obj, T.stringof);
}

void layout_dbind_update(S, string fieldName)(Layout *layout) 
if (is(S == struct))
{
    enum s = S.init;
    layout_dbind_update_imp(
            layout,
            S.stringof,
            cast(uint16_t)S.sizeof,
            fieldName,
            typeof(__traits(getMember, s, fieldName)).stringof,
            cast(uint16_t)__traits(getMember, s, fieldName).offsetof,
            cast(uint16_t)__traits(getMember, s, fieldName).sizeof
    );
}