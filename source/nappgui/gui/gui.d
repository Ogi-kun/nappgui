/** 
 * Graphics User Interface
 * 
 * See_Also: https://nappgui.com/en/gui/gui.html
 */
module nappgui.gui.gui;


import nappgui.config;
import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.geom2d.geom2d;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

enum gui_notif_t
{
    ekGUI_NOTIF_LANGUAGE        = 1,
    ekGUI_NOTIF_WIN_DESTROY,
    ekGUI_NOTIF_MENU_DESTROY
}
mixin ExpandEnum!gui_notif_t;

struct Control;
struct Label;
struct Button;
struct PopUp;
struct Edit;
struct Combo;
struct ListBox;
struct UpDown;
struct Slider;
struct Progress;
struct View;
struct TextView;
struct ImageView;
struct TableView;
struct SplitView;
struct Layout;
struct Cell;
struct Panel;
struct Window;
struct Menu;
struct MenuItem;

alias FPtr_respack = ResPack* function(const char_t *locale);

void gui_start();

void gui_finish();

void gui_respack(FPtr_respack func_respack);

void gui_language(const char_t *lang);

const(char_t) *gui_text(const ResId id);

const(Image) *gui_image(const ResId id);

const(byte_t) *gui_file(const ResId id, uint32_t *size);

bool_t gui_dark_mode();

color_t gui_alt_color(const color_t light_color, const color_t dark_color);

color_t gui_label_color();

color_t gui_view_color();

color_t gui_line_color();

color_t gui_link_color();

color_t gui_border_color();

S2Df gui_resolution();

V2Df gui_mouse_pos();

void gui_update();

void gui_OnThemeChanged(Listener *listener);

void gui_update_transitions(const real64_t prtime, const real64_t crtime);

void gui_OnNotification(Listener *listener);

void *evbind_object_imp(Event *e, const char_t *type);

bool_t evbind_modify_imp(Event *e, const char_t *type, uint16_t size, 
        const char_t *mname, const char_t *mtype, uint16_t moffset, uint16_t msize);

T* evbind_object(T)(Event* e) {
    return cast(T*)evbind_object_imp(e, T.stringof);
}

bool_t evbind_modify(S, string fieldName)(Event *e)
if (is(S == struct))
{
    enum s = S.init;
    return evbind_modify_imp(
            e,
            S.stringof,
            cast(uint16_t)S.sizeof,
            fieldName,
            typeof(__traits(getMember, s, fieldName)).stringof,
            cast(uint16_t)__traits(getMember, s, fieldName).offsetof,
            cast(uint16_t)__traits(getMember, s, fieldName).sizeof
    );
}