/** 
 * Menu Item
 * 
 * See_Also: https://nappgui.com/en/gui/menuitem.html
 */
module nappgui.gui.menuitem;

import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.draw2d.guictx;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

MenuItem *menuitem_create();

MenuItem *menuitem_separator();

void menuitem_OnClick(MenuItem *item, Listener *listener);

void menuitem_enabled(MenuItem *item, bool_t enabled);

void menuitem_visible(MenuItem *item, bool_t visible);

void menuitem_text(MenuItem *item, const char_t *text);

void menuitem_image(MenuItem *item, const Image *image);

void menuitem_key(MenuItem *item, vkey_t key, uint32_t modifiers);

void menuitem_submenu(MenuItem *item, Menu **submenu);

void menuitem_state(MenuItem *item, gui_state_t state);
