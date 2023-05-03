/** 
 * Menu
 * 
 * See_Also: https://nappgui.com/en/gui/menu.html
 */
module nappgui.gui.menu;

import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.gui.gui;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Menu *menu_create();

void menu_destroy(Menu **menu);

void menu_item(Menu *menu, MenuItem *item);

void menu_launch(Menu *menu, const V2Df position);

void menu_hide(Menu *menu);

void menu_off_items(Menu *menu);

MenuItem *menu_get_item(Menu *menu, uint32_t index);

uint32_t menu_size(const Menu *menu);

void *menu_imp(const Menu *menu);


