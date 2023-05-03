/* Undocumented (hidden) Core library types */

module nappgui.core.coreh;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;
import nappgui.osbs.osbs;

extern(C) @nogc nothrow:

enum dtype_t
{
    ekDTYPE_BOOL,
    ekDTYPE_INT8,
    ekDTYPE_INT16,
    ekDTYPE_INT32,
    ekDTYPE_INT64,
    ekDTYPE_UINT8,
    ekDTYPE_UINT16,
    ekDTYPE_UINT32,
    ekDTYPE_UINT64,
    ekDTYPE_REAL32,
    ekDTYPE_REAL64,
    ekDTYPE_ENUM,
    ekDTYPE_STRING,
    ekDTYPE_STRING_PTR,
    ekDTYPE_ARRAY,
    ekDTYPE_ARRPTR,
    ekDTYPE_OBJECT,
    ekDTYPE_OBJECT_PTR,
    ekDTYPE_OBJECT_OPAQUE,
    ekDTYPE_UNKNOWN
}
mixin ExpandEnum!ltoken_t;

struct DBind;
struct StBind;

debug {
    struct Object
    {
        uint32_t count;
    }
}
else {
    struct Object;
}

version (NAppGUI_NoGC_Callbacks) {
    extern(C) nothrow @nogc mixin Callbacks;
}
else { 
    extern(C) nothrow mixin Callbacks; 
}
private mixin template Callbacks() {
    alias FPtr_data = void* function(const byte_t *data, uint32_t size);
    alias FPtr_buffer = Buffer* function(const void *obj);
    alias FPtr_create_from_data = void* function(const byte_t *data, uint32_t size);
}
