/** Core library
 * 
 * See_Also: https://nappgui.com/en/core/core.html
 */

module nappgui.core.core;

import nappgui.config;
import nappgui.sewer.types;
import nappgui.osbs.osbs;

enum core_event_t
{
    ekEASSERT = 0x100,
    ekEFILE,
    ekEENTRY,
    ekEEXIT
}
mixin ExpandEnum!core_event_t;

enum sstate_t
{
    ekSTOK,
    ekSTEND,
    ekSTCORRUPT,
    ekSTBROKEN
}
mixin ExpandEnum!sstate_t;

enum vkey_t
{
    ekKEY_UNDEF             = 0,
    ekKEY_A                 = 1,
    ekKEY_S                 = 2,
    ekKEY_D                 = 3,
    ekKEY_F                 = 4,
    ekKEY_H                 = 5,
    ekKEY_G                 = 6,
    ekKEY_Z                 = 7,
    ekKEY_X                 = 8,
    ekKEY_C                 = 9,
    ekKEY_V                 = 10,
    ekKEY_BSLASH            = 11,
    ekKEY_B                 = 12,
    ekKEY_Q                 = 13,
    ekKEY_W                 = 14,
    ekKEY_E                 = 15,
    ekKEY_R                 = 16,
    ekKEY_Y                 = 17,
    ekKEY_T                 = 18,
    ekKEY_1                 = 19,
    ekKEY_2                 = 20,
    ekKEY_3                 = 21,
    ekKEY_4                 = 22,
    ekKEY_6                 = 23,
    ekKEY_5                 = 24,
    ekKEY_9                 = 25,
    ekKEY_7                 = 26,
    ekKEY_8                 = 27,
    ekKEY_0                 = 28,
    ekKEY_RCURLY            = 29,
    ekKEY_O                 = 30,
    ekKEY_U                 = 31,
    ekKEY_LCURLY            = 32,
    ekKEY_I                 = 33,
    ekKEY_P                 = 34,
    ekKEY_RETURN            = 35,
    ekKEY_L                 = 36,
    ekKEY_J                 = 37,
    ekKEY_SEMICOLON         = 38,
    ekKEY_K                 = 39,
    ekKEY_QUEST             = 40,
    ekKEY_COMMA             = 41,
    ekKEY_MINUS             = 42,
    ekKEY_N                 = 43,
    ekKEY_M                 = 44,
    ekKEY_PERIOD            = 45,
    ekKEY_TAB               = 46,
    ekKEY_SPACE             = 47,
    ekKEY_GTLT              = 48,
    ekKEY_BACK              = 49,
    ekKEY_ESCAPE            = 50,
    ekKEY_F17               = 51,
    ekKEY_NUMDECIMAL        = 52,
    ekKEY_NUMMULT           = 53,
    ekKEY_NUMADD            = 54,
    ekKEY_NUMLOCK           = 55,
    ekKEY_NUMDIV            = 56,
    ekKEY_NUMRET            = 57,
    ekKEY_NUMMINUS          = 58,
    ekKEY_F18               = 59,
    ekKEY_F19               = 60,
    ekKEY_NUMEQUAL          = 61,
    ekKEY_NUM0              = 62,
    ekKEY_NUM1              = 63,
    ekKEY_NUM2              = 64,
    ekKEY_NUM3              = 65,
    ekKEY_NUM4              = 66,
    ekKEY_NUM5              = 67,
    ekKEY_NUM6              = 68,
    ekKEY_NUM7              = 69,
    ekKEY_NUM8              = 70,
    ekKEY_NUM9              = 71,
    ekKEY_F5                = 72,
    ekKEY_F6                = 73,
    ekKEY_F7                = 74,
    ekKEY_F3                = 75,
    ekKEY_F8                = 76,
    ekKEY_F9                = 77,
    ekKEY_F11               = 78,
    ekKEY_F13               = 79,
    ekKEY_F16               = 80,
    ekKEY_F14               = 81,
    ekKEY_F10               = 82,
    ekKEY_F12               = 83,
    ekKEY_F15               = 84,
    ekKEY_PAGEUP            = 85,
    ekKEY_HOME              = 86,
    ekKEY_SUPR              = 87,
    ekKEY_F4                = 88,
    ekKEY_PAGEDOWN          = 89,
    ekKEY_F2                = 90,
    ekKEY_END               = 91,
    ekKEY_F1                = 92,
    ekKEY_LEFT              = 93,
    ekKEY_RIGHT             = 94,
    ekKEY_DOWN              = 95,
    ekKEY_UP                = 96,
    ekKEY_LSHIFT            = 97,
    ekKEY_RSHIFT            = 98,
    ekKEY_LCTRL             = 99,
    ekKEY_RCTRL             = 100,
    ekKEY_LALT              = 101,
    ekKEY_RALT              = 102,
    ekKEY_INSERT            = 103,
    ekKEY_EXCLAM            = 104,
    ekKEY_MENU              = 105,
    ekKEY_LWIN              = 106,
    ekKEY_RWIN              = 107,
    ekKEY_CAPS              = 108,
    ekKEY_TILDE             = 109,
    ekKEY_GRAVE             = 110,
    ekKEY_PLUS              = 111
}
mixin ExpandEnum!vkey_t;

enum kKEY_MAX = 112;

enum mkey_t
{
    ekMKEY_NONE     = 0,
    ekMKEY_SHIFT    = 1,
    ekMKEY_CONTROL  = 1 << 1,
    ekMKEY_ALT      = 1 << 2,
    ekMKEY_COMMAND  = 1 << 3
}
mixin ExpandEnum!mkey_t;

enum ltoken_t
{
    ekTSLCOM = 1,
    ekTMLCOM,
    ekTSPACE,
    ekTEOL,

    ekTLESS,        /* < */
    ekTGREAT,       /* > */
    ekTCOMMA,       /* , */
    ekTPERIOD,      /* . */
    ekTSCOLON,      /* ; */
    ekTCOLON,       /* : */

    ekTOPENPAR,     /* ( */
    ekTCLOSPAR,     /* ) */
    ekTOPENBRAC,    /* [ */
    ekTCLOSBRAC,    /* ] */
    ekTOPENCURL,    /* { */
    ekTCLOSCURL,    /* } */

    ekTPLUS,        /* + */
    ekTMINUS,       /* - */
    ekTASTERK,      /* * */
    ekTEQUALS,      /* = */

    ekTDOLLAR,      /* $ */
    ekTPERCENT,     /* % */
    ekTPOUND,       /* # */
    ekTAMPER,       /* & */

    ekTAPOST,       /* ' */
    ekTQUOTE,       /* " */
    ekTCIRCUM,      /* ^ */
    ekTTILDE,       /* ~ */
    ekTEXCLA,       /* ! */
    ekTQUEST,       /* ? */
    ekTVLINE,       /* | */
    ekTSLASH,       /* / */
    ekTBSLASH,      /* \ */
    ekTAT,          /* @ */

    ekTINTEGER,
    ekTOCTAL,
    ekTHEX,
    ekTREAL,
    ekTSTRING,
    ekTIDENT,

    ekTUNDEF,
    ekTCORRUP,
    ekTEOF,

    ekTRESERVED

}
mixin ExpandEnum!ltoken_t;

alias ResId = const(char_t)*;

debug {
    /* Only for debugger inspection */

    struct Buffer
    {
        uint32_t size;
        char[512] data;
    }

    struct String
    {
        uint32_t size;
        char[512] data;
    }

    
}
else {
    struct Buffer;
    struct String;
}

struct Stream;
struct Array;
struct RBTree;
struct RegEx;
struct Event;
struct KeyBuf;
struct Listener;
struct ResPack;
struct Clock;

struct DirEntry
{
    String *name;
    file_type_t type;
    uint64_t size;
    Date date;
}

struct EvFileDir
{
    const(char_t)* filename;
    const(char_t)* pathname;
    uint32_t depth;
}

enum HEAPARR         = "::arr";
enum ARRST           = "ArrSt::";
enum ARRPT           = "ArrPt::";
enum SETST           = "SetSt::";
enum SETPT           = "SetPt::";

version (NAppGUI_NoGC_Callbacks) {
    extern(C) nothrow @nogc mixin Callbacks;
}
else { 
    extern(C) nothrow mixin Callbacks; 
}
private mixin template Callbacks() {

    alias FPtr_remove = void function(void *obj);
    bool IS_REMOVE_FUNC(alias fun, T) = is(typeof(&fun) : void function(T*));

    alias FPtr_event_handler = void function(void *obj, Event *event);
    bool IS_EVENT_HANDLER_FUNC(alias fun, T) = is(typeof(&fun) : void function(T*, Event*));

    alias FPtr_read = void* function(Stream *stream);
    bool IS_READ_FUNC(alias fun, T) = is(typeof(&fun) : T* function(Stream*));

    alias FPtr_read_init = void function(Stream *stream, void* obj);
    bool IS_READ_INIT_FUNC(alias fun, T) = is(typeof(&fun) : void function(Stream*, T*));

    alias FPtr_write = void function(Stream *stream, const void* obj);
    bool IS_WRITE_FUNC(alias fun, T) = is(typeof(&fun) : void function(Stream*, const T*));

    deprecated("Use `static assert(IS_REMOVE_FUNC!(fun, T))`")
    void FUNC_CHECK_REMOVE(alias fun, T)() { 
        static assert(IS_REMOVE_FUNC!(fun, T)); 
    }

    deprecated("Use `static assert(IS_EVENT_HANDLER_FUNC!(fun, T))`")
    void FUNC_CHECK_EVENT_HANDLER(alias fun, T)() { 
        static assert(IS_EVENT_HANDLER_FUNC!(fun, T)); 
    }

    deprecated("Use `static assert(IS_READ_FUNC!(fun, T))`")
    void FUNC_CHECK_READ(alias fun, T)() { 
        static assert(IS_READ_FUNC!(fun, T)); 
    }

    deprecated("Use `static assert(IS_READ_INIT_FUNC!(fun, T))`")
    void FUNC_CHECK_READ_INIT(alias fun, T)() { 
        static assert(IS_READ_INIT_FUNC!(fun, T)); 
    }

    deprecated("Use `static assert(IS_WRITE_FUNC!(fun, T))`")
    void FUNC_CHECK_WRITE(alias fun, T)() { 
        static assert(IS_WRITE_FUNC!(fun, T)); 
    }
}

extern(C) @nogc nothrow:

void core_start();

void core_finish();