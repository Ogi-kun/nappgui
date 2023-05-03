/** 
 * Layout-cells
 * 
 * See_Also: https://nappgui.com/en/gui/cell.html
 */
module nappgui.gui.cell;

import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void *cell_control_imp(Cell *cell, const char_t *type);

Layout *cell_layout(Cell *cell);

void cell_enabled(Cell *cell, bool_t enabled);

void cell_visible(Cell *cell, bool_t visible);

void cell_focus(Cell *cell);

void cell_padding(Cell *cell, real32_t pall);

void cell_padding2(Cell *cell, real32_t ptb, real32_t plr);

void cell_padding4(Cell *cell, real32_t pt, real32_t pr, real32_t pb, real32_t pl);

void cell_dbind_imp(
            Cell *cell,
            const char_t *type,
            uint16_t size,
            const char_t *mname,
            const char_t *mtype,
            uint16_t moffset,
            uint16_t msize);

Label* cell_label()(Cell *cell) {
    return cast(Label*)cell_control_imp(cell, "Label");
}

Button* cell_button()(Cell *cell) {
    return cast(Button*)cell_control_imp(cell, "Button");
} 

PopUp* cell_popup()(Cell *cell) {
    return cast(PopUp*)cell_control_imp(cell, "PopUp");
} 

Edit* cell_edit()(Cell *cell) {
    return cast(Edit*)cell_control_imp(cell, "Edit");
} 

Combo* cell_combo()(Cell *cell) {
    return cast(Combo*)cell_control_imp(cell, "Combo");
} 

ListBox* cell_listbox()(Cell *cell) {
    return cast(ListBox*)cell_control_imp(cell, "ListBox");
} 

UpDown* cell_updown()(Cell *cell) {
    return cast(UpDown*)cell_control_imp(cell, "UpDown");
} 

Slider* cell_slider()(Cell *cell) {
    return cast(Slider*)cell_control_imp(cell, "Slider");
} 

Progress* cell_progress()(Cell *cell) {
    return cast(Progress*)cell_control_imp(cell, "Progress");
} 

View* cell_view()(Cell *cell) {
    return cast(View*)cell_control_imp(cell, "View");
} 

TextView* cell_textview()(Cell *cell) {
    return cast(TextView*)cell_control_imp(cell, "TextView");
} 

ImageView* cell_imageview()(Cell *cell) {
    return cast(ImageView*)cell_control_imp(cell, "ImageView");
} 

TableView* cell_tableview()(Cell *cell) {
    return cast(TableView*)cell_control_imp(cell, "TableView");
} 

SplitView* cell_splitview()(Cell *cell) {
    return cast(SplitView*)cell_control_imp(cell, "SplitView");
} 

Panel* cell_panel()(Cell *cell) {
    return cast(Panel*)cell_control_imp(cell, "Panel");
} 

void cell_dbind(S, string fieldName)(Cell *cell) 
if (is(S == struct))
{
    enum s = S.init;
    cell_dbind_imp(
            cell,
            S.stringof,
            cast(uint16_t)S.sizeof,
            fieldName,
            typeof(__traits(getMember, s, fieldName)).stringof,
            cast(uint16_t)__traits(getMember, s, fieldName).offsetof,
            cast(uint16_t)__traits(getMember, s, fieldName).sizeof
    );
}