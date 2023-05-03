/* Gui rendering context */
module nappgui.draw2d.guictx_types;

import nappgui.config;
import nappgui.core.arrst;
import nappgui.core.core;
import nappgui.draw2d.draw2d;
import nappgui.sewer.types;

enum gui_orient_t
{
    ekGUI_HORIZONTAL        = 1,
    ekGUI_VERTICAL
}
mixin ExpandEnum!gui_orient_t;

enum gui_state_t
{
    ekGUI_OFF               = 0,
    ekGUI_ON,
    ekGUI_MIXED
}
mixin ExpandEnum!gui_state_t;

enum gui_mouse_t
{
    ekGUI_MOUSE_LEFT = 1,
    ekGUI_MOUSE_RIGHT,
    ekGUI_MOUSE_MIDDLE
}
mixin ExpandEnum!gui_mouse_t;

enum gui_cursor_t
{
    ekGUI_CURSOR_ARROW = 1,
    ekGUI_CURSOR_HAND,
    ekGUI_CURSOR_IBEAM,
    ekGUI_CURSOR_CROSS,
    ekGUI_CURSOR_SIZEWE,
    ekGUI_CURSOR_SIZENS,
    ekGUI_CURSOR_USER
}
mixin ExpandEnum!gui_cursor_t;

enum gui_close_t
{
    ekGUI_CLOSE_ESC = 1,
    ekGUI_CLOSE_INTRO,
    ekGUI_CLOSE_BUTTON,
    ekGUI_CLOSE_DEACT
}
mixin ExpandEnum!gui_close_t;

enum gui_scale_t
{
    ekGUI_SCALE_AUTO = 1,
    ekGUI_SCALE_NONE,
    ekGUI_SCALE_ASPECT,
    ekGUI_SCALE_ASPECTDW
}
mixin ExpandEnum!gui_scale_t;

enum gui_event_t
{
    ekGUI_EVENT_LABEL = 0x400,
    ekGUI_EVENT_BUTTON,
    ekGUI_EVENT_POPUP,
    ekGUI_EVENT_LISTBOX,
    ekGUI_EVENT_SLIDER,
    ekGUI_EVENT_UPDOWN,
    ekGUI_EVENT_TXTFILTER,
    ekGUI_EVENT_TXTCHANGE,
    ekGUI_EVENT_FOCUS,
    ekGUI_EVENT_MENU,
    ekGUI_EVENT_DRAW,
    ekGUI_EVENT_OVERLAY,
    ekGUI_EVENT_RESIZE,
    ekGUI_EVENT_ENTER,
    ekGUI_EVENT_EXIT,
    ekGUI_EVENT_MOVED,
    ekGUI_EVENT_DOWN,
    ekGUI_EVENT_UP,
    ekGUI_EVENT_CLICK,
    ekGUI_EVENT_DRAG,
    ekGUI_EVENT_WHEEL,
    ekGUI_EVENT_KEYDOWN,
    ekGUI_EVENT_KEYUP,
    ekGUI_EVENT_WND_MOVED,
    ekGUI_EVENT_WND_SIZING,
    ekGUI_EVENT_WND_SIZE,
    ekGUI_EVENT_WND_CLOSE,
    ekGUI_EVENT_COLOR,
    ekGUI_EVENT_THEME,
    ekGUI_EVENT_OBJCHANGE,

    ekGUI_EVENT_TBL_NROWS,
    ekGUI_EVENT_TBL_BEGIN,
    ekGUI_EVENT_TBL_END,
    ekGUI_EVENT_TBL_CELL,
    ekGUI_EVENT_TBL_SEL,
    ekGUI_EVENT_TBL_HEADCLICK
}
mixin ExpandEnum!gui_event_t;

enum gui_type_t
{
	/* Basic controls */
    ekGUI_TYPE_LABEL        = 0,
    ekGUI_TYPE_BUTTON       = 1,
    ekGUI_TYPE_POPUP        = 2,
    ekGUI_TYPE_EDITBOX      = 3,
    ekGUI_TYPE_COMBOBOX     = 4,
    ekGUI_TYPE_SLIDER       = 5,
    ekGUI_TYPE_UPDOWN       = 6,
    ekGUI_TYPE_PROGRESS     = 7,

	/* View Controls */
    ekGUI_TYPE_TEXTVIEW     = 8,
    ekGUI_TYPE_TABLEVIEW    = 9,
    ekGUI_TYPE_TREEVIEW     = 10,
	ekGUI_TYPE_BOXVIEW      = 11,
    ekGUI_TYPE_SPLITVIEW    = 12,
    ekGUI_TYPE_CUSTOMVIEW   = 13,

    /* Others */
    ekGUI_TYPE_PANEL        = 14,
    ekGUI_TYPE_LINE         = 15,
    ekGUI_TYPE_HEADER       = 16,

    /* Non-Components */
    ekGUI_TYPE_WINDOW       = 17,
    ekGUI_TYPE_TOOLBAR      = 18
}
mixin ExpandEnum!gui_type_t;

enum GUI_CONTEXT_NUM_COMPONENTS  = 17;

enum gui_size_t
{
    ekGUI_SIZE_MINI = 1,
    ekGUI_SIZE_SMALL,
    ekGUI_SIZE_REGULAR
}
mixin ExpandEnum!gui_size_t;

enum gui_role_t
{
    ekGUI_ROLE_MAIN             = 0,
    ekGUI_ROLE_OVERLAY          = 1,
    ekGUI_ROLE_MODAL            = 2,
    ekGUI_ROLE_MANAGED          = 3
}
mixin ExpandEnum!gui_role_t;

enum gui_prop_t
{
    ekGUI_PROP_RESIZE = 0,
    ekGUI_PROP_CHILDREN = 1,
    ekGUI_PROP_FAMILY,
    ekGUI_PROP_UNITS,
    ekGUI_PROP_SIZE,
    ekGUI_PROP_STYLE,
    ekGUI_PROP_COLOR,
    ekGUI_PROP_BGCOLOR,
    ekGUI_PROP_PGCOLOR,
    ekGUI_PROP_PARALIGN,
    ekGUI_PROP_LSPACING,
    ekGUI_PROP_BFPARSPACE,
    ekGUI_PROP_AFPARSPACE,
    ekGUI_PROP_VSCROLL
}
mixin ExpandEnum!gui_prop_t;

enum label_flag_t
{
    ekLABEL_FLAG    = 0,
    ekLABEL_SINGLE  = 0,
    ekLABEL_MULTI   = 1,
    ekLABEL_TYPE    = 1
}
mixin ExpandEnum!label_flag_t;

enum button_flag_t
{
    ekBUTTON_FLAG       = 0,
    ekBUTTON_PUSH       = 0,
    ekBUTTON_CHECK2     = 1,
    ekBUTTON_CHECK3     = 2,
    ekBUTTON_RADIO      = 3,
    ekBUTTON_FLAT       = 4,
    ekBUTTON_FLATGLE    = 5,
    ekBUTTON_HEADER     = 6,
    ekBUTTON_TYPE       = 7
}
mixin ExpandEnum!button_flag_t;

enum popup_flag_t
{
    ekPOPUP_FLAG = 0
}
mixin ExpandEnum!popup_flag_t;

enum edit_flag_t
{
    ekEDIT_FLAG     = 0,
    ekEDIT_SINGLE   = 0,
    ekEDIT_MULTI    = 1,
    ekEDIT_TYPE     = 1,
    ekEDIT_AUTOSEL  = 4
}
mixin ExpandEnum!edit_flag_t;

enum combo_flag_t
{
    ekCOMBO_FLAG    = 0
}
mixin ExpandEnum!combo_flag_t;

enum slider_flag_t
{
    ekSLIDER_FLAG   = 0,
    ekSLIDER_HORZ   = 0,
    ekSLIDER_VERT   = 1,
    ekSLIDER_TYPE   = 1
}
mixin ExpandEnum!slider_flag_t;

enum updown_flag_t
{
    ekUPDOWN_FLAG   = 0
}
mixin ExpandEnum!updown_flag_t;

enum progress_flag_t
{
    ekPROGRESS_FLAG     = 0,
    ekPROGRESS_HORZ     = 0,
    ekPROGRESS_VERT     = 1,
    ekPROGRESS_TYPE     = 1
}
mixin ExpandEnum!progress_flag_t;

enum view_flag_t
{
    ekVIEW_OPENGL       = 0x1,
    ekVIEW_HSCROLL      = 0x2,
    ekVIEW_VSCROLL      = 0x4,
    ekVIEW_BORDER       = 0x8,
    ekVIEW_NOERASE      = 0x20,
    ekVIEW_CONTROL      = 0x40
}
mixin ExpandEnum!view_flag_t;

enum text_flag_t
{
    ekTEXT_FLAG         = 0
}
mixin ExpandEnum!text_flag_t;

enum table_flag_t
{
    ekTABLE_FLAG        = 0,
    ekTABLE_TEXT        = 0x1,
    ekTABLE_ICON16      = 0x2,
    ekTABLE_EDIT        = 0x4,
    ekTABLE_COMBO       = 0x8,
    ekTABLE_POPUP       = 0x10,
    ekTABLE_RADIO       = 0x20,
    ekTABLE_CHECK       = 0x40,
    ekTABLE_TOOLTIP     = 0x80,
    ekTABLE_BGCOLOR     = 0x100,
    ekTABLE_ROWALT      = 0x200,
    ekTABLE_ROWPRESEL   = 0x400
}
mixin ExpandEnum!table_flag_t;

enum split_flag_t
{
    ekSPLIT_FLAG    = 0,
    ekSPLIT_VERT    = 0,
    ekSPLIT_HORZ    = 1,
    ekSPLIT_TYPE    = 1,
    ekSPLIT_PROP    = 2,
    ekSPLIT_LEFT    = 3,
    ekSPLIT_RIGHT   = 4
}
mixin ExpandEnum!split_flag_t;

enum window_flag_t
{
    ekWINDOW_FLAG           = 0,
    ekWINDOW_EDGE           = 1 << 0,
    ekWINDOW_TITLE          = 1 << 1,
    ekWINDOW_MAX            = 1 << 2,
    ekWINDOW_MIN            = 1 << 3,
    ekWINDOW_CLOSE          = 1 << 4,
    ekWINDOW_RESIZE         = 1 << 5,
    ekWINDOW_RETURN         = 1 << 6,
    ekWINDOW_ESC            = 1 << 7,
    ekWINDOW_STD            = ekWINDOW_TITLE | ekWINDOW_MIN | ekWINDOW_CLOSE,
    ekWINDOW_STDRES         = ekWINDOW_STD | ekWINDOW_MAX | ekWINDOW_RESIZE
}
mixin ExpandEnum!window_flag_t;

enum menu_flag_t
{
    ekMENU_FLAG     = 0,
    ekMENU_ITEM,
    ekMENU_SEPARATOR
}
mixin ExpandEnum!menu_flag_t;

enum ctrl_state_t
{
    ekCTRL_STATE_NORMAL,
    ekCTRL_STATE_HOT,
    ekCTRL_STATE_PRESSED,
    ekCTRL_STATE_BKNORMAL,
    ekCTRL_STATE_BKHOT,
    ekCTRL_STATE_BKPRESSED,
    ekCTRL_STATE_DISABLED
}
mixin ExpandEnum!ctrl_state_t;

enum ctrl_msel_t
{
    ekCTRL_MSEL_NO,
    ekCTRL_MSEL_SINGLE,
    ekCTRL_MSEL_BURST
}
mixin ExpandEnum!ctrl_msel_t;

enum ctrl_op_t
{
    ekCTRL_OP_ADD = 1,
    ekCTRL_OP_DEL,
    ekCTRL_OP_INS,
    ekCTRL_OP_SET
}
mixin ExpandEnum!ctrl_op_t;

enum syscolor_t
{
    ekSYSCOLOR_DARKMODE = 0,
    ekSYSCOLOR_LABEL,
    ekSYSCOLOR_VIEW,
    ekSYSCOLOR_LINE,
    ekSYSCOLOR_LINK,
    ekSYSCOLOR_BORDER
}
mixin ExpandEnum!syscolor_t;

struct Cursor;

int label_get_type()(int flags)       { return flags & ekLABEL_TYPE; }
int button_get_type()(int flags)      { return flags & ekBUTTON_TYPE; }
int edit_get_type()(int flags)        { return flags & ekEDIT_TYPE; }
int slider_get_type()(int flags)      { return flags & ekSLIDER_TYPE; }
int progress_get_type()(int flags)    { return flags & ekPROGRESS_TYPE; }
int split_get_type()(int flags)		  { return flags & ekSPLIT_TYPE; }

version (NAppGUI_NoGC_Callbacks) {
    extern(C) nothrow @nogc mixin Callbacks;
}
else { 
    extern(C) nothrow mixin Callbacks; 
}
private mixin template Callbacks() {

    alias FPtr_gctx_create = void* function(uint32_t flags);

    alias FPtr_gctx_create2 = void* function(void*);

    alias FPtr_gctx_destroy = void function(void **item);

    alias FPtr_gctx_set_text = void function(void *item, const char_t *text);

    alias FPtr_gctx_set_ptr = void function(void *item, void *ptr);

    alias FPtr_gctx_set_ptr2 = uint32_t function(void *item, void *ptr);

    alias FPtr_gctx_set_cptr = void function(void *item, const void *ptr);

    alias FPtr_gctx_set_listener = void function(void *item, Listener *listener);

    alias FPtr_gctx_set_bool = void function(void *item, bool_t value);

    alias FPtr_gctx_set_uint32 = void function(void *item, uint32_t value);

    alias FPtr_gctx_set_real32 = void function(void *item, real32_t value);

    alias FPtr_gctx_set_enum = void function(void *item, enum_t value);

    alias FPtr_gctx_set_elem = void function(void *item, ctrl_op_t op, uint32_t index, 
            const char_t *text, const Image *data);

    alias FPtr_gctx_set_property = void function(void *item, gui_prop_t prop, const void *value);

    alias FPtr_gctx_set_key = void function(void *item, uint32_t key, uint32_t modifiers);

    alias FPtr_gctx_set_hotkey = void function(void *item, vkey_t, uint32_t, Listener*);

    alias FPtr_gctx_set_area = void function(void *item, void *obj, color_t bgcolor, color_t skcolor, 
            real32_t x, real32_t y, real32_t width, real32_t height);

    alias FPtr_gctx_set2_real32 = void function(void *item, real32_t value1, real32_t value2);

    alias FPtr_gctx_set4_real32 = void function(void *item, real32_t value1, real32_t value2,
            real32_t value3, real32_t value4);

    alias FPtr_gctx_get_text = const(char_t)* function(const void *item);

    alias FPtr_gctx_get_ptr = void* function(const void *item);

    alias FPtr_gctx_get_uint32 = uint32_t function(const void *item);

    alias FPtr_gctx_get_real32 = real32_t function(const void *item);

    alias FPtr_gctx_get_enum = enum_t function(const void *item);

    alias FPtr_gctx_get_real32e = real32_t function(const void *item, enum_t value);

    alias FPtr_gctx_get_enum2 = enum_t function(const void *item, enum_t);

    alias FPtr_gctx_get2_real32 = void function(const void *item, real32_t *value1, real32_t *value2);

    alias FPtr_gctx_get_indexed = void function(const uint32_t, void*);

    alias FPtr_gctx_call = void function(void *item);

    alias FPtr_gctx_bounds1 = void function(const void *item, const char_t *text, 
            real32_t refwidth, real32_t *width, real32_t *height);

    alias FPtr_gctx_bounds2 = void function(const void *item, const char_t *text, 
            real32_t refwidth, real32_t refheight, real32_t *width, real32_t *height);

    alias FPtr_gctx_bounds3 = void function(const void *item, const char_t *text, real32_t *width, real32_t *height);

    alias FPtr_gctx_bounds4 = void function(const void *item, real32_t refwidth, 
            uint32_t lines, real32_t *width, real32_t *height);

    alias FPtr_gctx_bounds5 = void function(const void *item, real32_t refwidth, real32_t *width, real32_t *height);

    alias FPtr_gctx_bounds6 = void function(const void *item, real32_t length, 
            gui_size_t size, real32_t *width, real32_t *height);

    alias FPtr_gctx_tickmarks = void function(void *item, uint32_t num_tickmarks, bool_t tickmarks_at_left_top);

    alias FPtr_gctx_menu = void function(void *item, void *window, real32_t x, real32_t y);

    alias FPtr_gctx_win_file = const(char_t)* function(void *parent, const char_t **ftypes, 
            uint32_t size, const char_t *start_dir, bool_t open);

    alias FPtr_gctx_win_color = void function(void *parent, const char_t *title, 
            real32_t x, real32_t y, align_t halign, align_t valign, color_t current, 
            color_t *colors, uint32_t n, Listener *OnChange);

    alias FPtr_gctx_cursor = Cursor* function(enum_t, const Image*, real32_t, real32_t);

    alias FPtr_gctx_draw_rect = void function(void*, int32_t, int32_t, uint32_t, uint32_t, enum_t);

    alias FPtr_gctx_draw_line = void function(void*, int32_t, int32_t, int32_t, int32_t);

    alias FPtr_gctx_draw_text = void function(void*, const char_t*, int32_t, int32_t, enum_t);

    alias FPtr_gctx_draw_image = void function(void*, const Image*, int32_t, int32_t, enum_t);
}

struct GuiCtx
{
    uint32_t retain_count;

    /*! <Commons> */
    FPtr_gctx_create[GUI_CONTEXT_NUM_COMPONENTS] func_create;
    FPtr_gctx_destroy[GUI_CONTEXT_NUM_COMPONENTS] func_destroy;
    FPtr_gctx_set_text[GUI_CONTEXT_NUM_COMPONENTS] func_set_tooltip;
    FPtr_gctx_set_ptr[GUI_CONTEXT_NUM_COMPONENTS] func_attach_to_panel;
    FPtr_gctx_set_ptr[GUI_CONTEXT_NUM_COMPONENTS] func_detach_from_panel;
    FPtr_gctx_set_bool[GUI_CONTEXT_NUM_COMPONENTS] func_set_visible;
    FPtr_gctx_set_bool[GUI_CONTEXT_NUM_COMPONENTS] func_set_enabled;
    FPtr_gctx_get2_real32[GUI_CONTEXT_NUM_COMPONENTS] func_get_size;
    FPtr_gctx_get2_real32[GUI_CONTEXT_NUM_COMPONENTS] func_get_origin;
    FPtr_gctx_set4_real32[GUI_CONTEXT_NUM_COMPONENTS] func_set_frame;

    /*! <Label> */
    FPtr_gctx_set_listener func_label_OnClick;
    FPtr_gctx_set_listener func_label_OnMouseEnter;
    FPtr_gctx_set_listener func_label_OnMouseExit;
    FPtr_gctx_set_text func_label_set_text;
    FPtr_gctx_set_cptr func_label_set_font;
    FPtr_gctx_set_enum func_label_set_align;
    FPtr_gctx_set_enum func_label_set_ellipsis;
    FPtr_gctx_set_uint32 func_label_set_text_color;
    FPtr_gctx_set_uint32 func_label_set_bg_color;
    FPtr_gctx_bounds1 func_label_bounds;

    /*! <Button> */
    FPtr_gctx_set_listener func_button_OnClick;
    FPtr_gctx_set_text func_button_set_text;
    FPtr_gctx_set_cptr func_button_set_font;
    FPtr_gctx_set_enum func_button_set_align;
    FPtr_gctx_set_cptr func_button_set_image;
    FPtr_gctx_set_enum func_button_set_state;
    FPtr_gctx_get_enum func_button_get_state;
    FPtr_gctx_bounds2 func_button_bounds;

    /*! <PopUp> */
    FPtr_gctx_set_listener func_popup_OnChange;
    FPtr_gctx_set_elem func_popup_set_elem;
    FPtr_gctx_set_cptr func_popup_set_font;
    FPtr_gctx_set_uint32 func_popup_list_height;
    FPtr_gctx_set_uint32 func_popup_set_selected;
    FPtr_gctx_get_uint32 func_popup_get_selected;
    FPtr_gctx_bounds3 func_popup_bounds;

    /*! <Edit> */
    FPtr_gctx_set_listener func_edit_OnFilter;
    FPtr_gctx_set_listener func_edit_OnChange;
    FPtr_gctx_set_listener func_edit_OnFocus;
    FPtr_gctx_set_text func_edit_set_text;
    FPtr_gctx_set_cptr func_edit_set_font;
    FPtr_gctx_set_enum func_edit_set_align;
    FPtr_gctx_set_bool func_edit_set_passmode;
    FPtr_gctx_set_bool func_edit_set_editable;
    FPtr_gctx_set_bool func_edit_set_autoselect;
    FPtr_gctx_set_uint32 func_edit_set_text_color;
    FPtr_gctx_set_uint32 func_edit_set_bg_color;
    FPtr_gctx_bounds4 func_edit_bounds;

    /*! <Combo> */
    FPtr_gctx_set_listener func_combo_OnFilter;
    FPtr_gctx_set_listener func_combo_OnChange;
    FPtr_gctx_set_listener func_combo_OnFocus;
    FPtr_gctx_set_listener func_combo_OnSelect;
    FPtr_gctx_set_text func_combo_set_text;
    FPtr_gctx_set_cptr func_combo_set_font;
    FPtr_gctx_set_enum func_combo_set_align;
    FPtr_gctx_set_bool func_combo_set_passmode;
    FPtr_gctx_set_uint32 func_combo_set_text_color;
    FPtr_gctx_set_uint32 func_combo_set_bg_color;
    FPtr_gctx_set_elem func_combo_set_elem;
    FPtr_gctx_set_uint32 func_combo_set_selected;
    FPtr_gctx_get_uint32 func_combo_get_selected;
    FPtr_gctx_bounds5 func_combo_bounds;

    /*! <Slider> */
    FPtr_gctx_set_listener func_slider_OnMoved;
    FPtr_gctx_tickmarks func_slider_set_tickmarks;
    FPtr_gctx_get_real32 func_slider_get_position;
    FPtr_gctx_set_real32 func_slider_set_position;
    FPtr_gctx_bounds6 func_slider_bounds;

    /* UpDown */
    FPtr_gctx_set_listener func_updown_OnClick;

    /*! <Progress> */
    FPtr_gctx_set_real32 func_progress_set_position;
    FPtr_gctx_get_real32e func_progress_get_thickness;

    /*! <Text view> */
    FPtr_gctx_set_listener func_text_OnTextChange;
    FPtr_gctx_set_text func_text_insert_text;
    FPtr_gctx_set_text func_text_set_text;
    FPtr_gctx_set_ptr func_text_set_rtf;
    FPtr_gctx_set_property func_text_set_prop;
    FPtr_gctx_set_bool func_text_set_editable;
    FPtr_gctx_get_text func_text_get_text;
    FPtr_gctx_call func_text_set_need_display;

    /*! <Split view> */
    FPtr_gctx_set_ptr func_split_attach_control;
    FPtr_gctx_set_ptr func_split_detach_control;
    FPtr_gctx_set_listener func_split_OnDrag;
    FPtr_gctx_set4_real32 func_split_track_area;

    /*! <View> */
    FPtr_gctx_set_listener func_view_OnDraw;
    FPtr_gctx_set_listener func_view_OnOverlay;
    FPtr_gctx_set_listener func_view_OnEnter;
    FPtr_gctx_set_listener func_view_OnExit;
    FPtr_gctx_set_listener func_view_OnMoved;
    FPtr_gctx_set_listener func_view_OnDown;
    FPtr_gctx_set_listener func_view_OnUp;
    FPtr_gctx_set_listener func_view_OnClick;
    FPtr_gctx_set_listener func_view_OnDrag;
    FPtr_gctx_set_listener func_view_OnWheel;
    FPtr_gctx_set_listener func_view_OnKeyDown;
    FPtr_gctx_set_listener func_view_OnKeyUp;
    FPtr_gctx_set_listener func_view_OnFocus;
    FPtr_gctx_set_listener func_view_OnNotify;
    FPtr_gctx_set_listener func_view_OnTouchTap;
    FPtr_gctx_set_listener func_view_OnTouchStartDrag;
    FPtr_gctx_set_listener func_view_OnTouchDragging;
    FPtr_gctx_set_listener func_view_OnTouchEndDrag;
    FPtr_gctx_set_listener func_view_OnTouchStartPinch;
    FPtr_gctx_set_listener func_view_OnTouchPinching;
    FPtr_gctx_set_listener func_view_OnTouchEndPinch;
    FPtr_gctx_set2_real32 func_view_scroll;
    FPtr_gctx_get2_real32 func_view_scroll_get;
    FPtr_gctx_get2_real32 func_view_scroller_size;
    FPtr_gctx_set4_real32 func_view_content_size;
    FPtr_gctx_get_real32 func_view_scale_factor;
    FPtr_gctx_call func_view_set_need_display;
    FPtr_gctx_set_bool func_view_set_drawable;
    FPtr_gctx_get_ptr func_view_get_native_view;

	/*! <Panels> */
    FPtr_gctx_set_area func_panel_area;
    FPtr_gctx_get2_real32 func_panel_scroller_size;
    FPtr_gctx_set4_real32 func_panel_content_size;
    FPtr_gctx_call func_panel_set_need_display;

    /*! <Menus> */
    FPtr_gctx_create func_menu_create;
    FPtr_gctx_destroy func_menu_destroy;
    FPtr_gctx_set_ptr func_attach_menuitem_to_menu;
    FPtr_gctx_set_ptr func_detach_menuitem_from_menu;
    FPtr_gctx_menu func_menu_launch_popup;
    FPtr_gctx_call func_menu_hide_popup;

    /*! <MenuItems> */
    FPtr_gctx_create func_menuitem_create;
    FPtr_gctx_destroy func_menuitem_destroy;
    FPtr_gctx_set_listener func_menuitem_OnClick;
    FPtr_gctx_set_bool func_menuitem_set_enabled;
    FPtr_gctx_set_bool func_menuitem_set_visible;
    FPtr_gctx_set_text func_menuitem_set_text;
    FPtr_gctx_set_cptr func_menuitem_set_image;
    FPtr_gctx_set_key func_menuitem_set_key_equivalent;
    FPtr_gctx_set_enum func_menuitem_set_state;
    FPtr_gctx_set_ptr func_attach_menu_to_menu_item;
    FPtr_gctx_set_ptr func_detach_menu_from_menu_item;

    /*! <Windows> */
    FPtr_gctx_create func_window_create;
    FPtr_gctx_create2 func_window_managed;
    FPtr_gctx_destroy func_window_destroy;
    FPtr_gctx_set_listener func_window_OnMoved;
    FPtr_gctx_set_listener func_window_OnResize;
    FPtr_gctx_set_listener func_window_OnClose;
    FPtr_gctx_set_text func_window_set_title;
    FPtr_gctx_set_bool func_window_set_edited;
    FPtr_gctx_set_bool func_window_set_movable;
    FPtr_gctx_set_ptr func_window_set_z_order;
    FPtr_gctx_set_real32 func_window_set_alpha;
    FPtr_gctx_set_bool func_window_enable_mouse_events;
    FPtr_gctx_set_hotkey func_window_hotkey;
    FPtr_gctx_set_ptr func_window_set_taborder;
    FPtr_gctx_set_ptr func_window_set_focus;
    FPtr_gctx_set_ptr func_attach_main_panel_to_window;
    FPtr_gctx_set_ptr func_detach_main_panel_from_window;
    FPtr_gctx_set_ptr func_attach_window_to_window;
    FPtr_gctx_set_ptr func_detach_window_from_window;
    FPtr_gctx_set_ptr func_window_launch;
    FPtr_gctx_set_ptr func_window_hide;
    FPtr_gctx_set_ptr2 func_window_launch_modal;
    FPtr_gctx_set_uint32 func_window_stop_modal;
    FPtr_gctx_get2_real32 func_window_get_origin_in_screen_coordinates;
    FPtr_gctx_set2_real32 func_window_set_origin_in_screen_coordinates;
    FPtr_gctx_get2_real32 func_window_get_size;
    FPtr_gctx_set2_real32 func_window_set_size;
	FPtr_gctx_set_ptr func_window_set_default_pushbutton;
    FPtr_gctx_set_ptr func_window_set_cursor;
	FPtr_gctx_set_property func_window_set_property;

    /*! <Common Windows> */
    FPtr_gctx_win_file func_comwin_file;
    FPtr_gctx_win_color func_comwin_color;

    /*! <Globals> */
    FPtr_gctx_get_enum func_globals_device;
    FPtr_gctx_get_enum func_globals_color;
    FPtr_gctx_get2_real32 func_globals_resolution;
    FPtr_gctx_get2_real32 func_globals_mouse_position;
    FPtr_gctx_cursor func_globals_cursor;
    FPtr_gctx_destroy func_globals_cursor_destroy;
    FPtr_gctx_get_indexed func_globals_value;

    /*! <Draw Custom Controls> */
    FPtr_gctx_get_ptr func_drawctrl_font;
    FPtr_gctx_get_uint32 func_drawctrl_row_padding;
    FPtr_gctx_get_uint32 func_drawctrl_check_width;
    FPtr_gctx_get_uint32 func_drawctrl_check_height;
    FPtr_gctx_get_enum2 func_drawctrl_multisel;
    FPtr_gctx_draw_rect func_drawctrl_clear;
    FPtr_gctx_draw_rect func_drawctrl_header;
    FPtr_gctx_draw_rect func_drawctrl_indicator;
    FPtr_gctx_draw_rect func_drawctrl_fill;
    FPtr_gctx_draw_rect func_drawctrl_focus;
    FPtr_gctx_draw_line func_drawctrl_line;
    FPtr_gctx_draw_text func_drawctrl_text;
    FPtr_gctx_draw_image func_drawctrl_image;
    FPtr_gctx_draw_rect func_drawctrl_checkbox;
    FPtr_gctx_draw_rect func_drawctrl_uncheckbox;
}

struct EvButton
{
    uint32_t index;
    gui_state_t state;
    const(char_t) *text;
}

struct EvSlider
{
    real32_t pos;
    real32_t incr;
    uint32_t step;
}

struct EvText
{
    const(char_t) *text;
    uint32_t cpos;
}

enum kTEXTFILTER_SIZE = 1024;

struct EvTextFilter
{
    bool_t apply;
    char_t[kTEXTFILTER_SIZE] text;
    uint32_t cpos;
}

struct EvDraw
{
    DCtx *ctx;
    real32_t x;
    real32_t y;
    real32_t width;
    real32_t height;
}

struct EvMouse
{
    real32_t x;
    real32_t y;
    real32_t lx;
    real32_t ly;
    gui_mouse_t button;
    uint32_t count;
}

struct EvWheel
{
    real32_t x;
    real32_t y;
    real32_t dx;
    real32_t dy;
    real32_t dz;
}

struct EvKey
{
    vkey_t key;
    uint32_t modifiers;
}

struct EvPos
{
    real32_t x;
    real32_t y;
}

struct EvSize
{
    real32_t width;
    real32_t height;
}

struct EvWinClose
{
    gui_close_t origin;
}

struct EvMenu
{
    uint32_t index;
    gui_state_t state;
    const(char_t) *str;
}

struct EvTbPos
{
    uint32_t col;
    uint32_t row;
}

struct EvTbRect
{
    uint32_t stcol;
    uint32_t edcol;
    uint32_t strow;
    uint32_t edrow;
}

struct EvTbSel
{
    ArrSt!(uint32_t) *sel;
}

struct EvTbCell
{
    const(char_t) *text;
    align_t align_;
}