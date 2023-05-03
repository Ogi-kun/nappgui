/* Undocumented (hidden) API about generic object utilities */

module nappgui.core.objh;

import nappgui.config;
import nappgui.core.core;
import nappgui.core.coreh;
import nappgui.sewer.types;

import nappgui.core.coreh : Object;

extern(C) @nogc nothrow:

void obj_init(Object *object);

byte_t *obj_new_imp(uint32_t size, const char_t *T);

byte_t *obj_new0_imp(uint32_t size, const char_t *T);

void *obj_retain_imp(const void *object);

void *obj_retain_optional_imp(const void *object);

void obj_remove(Object *object);

void obj_release_imp(void **object);

void obj_release_optional_imp(void **object);

void obj_delete_imp(byte_t **object, uint32_t size, const char_t *T);

Listener *obj_listener_imp(void *object, FPtr_event_handler func_event_handler);

T* obj_new(T)() {
    return cast(T*)obj_new_imp(T.sizeof, T.stringof);
}

T* obj_new0(T)() {
    return cast(T*)obj_new0_imp(T.sizeof, T.stringof);
}

T* obj_retain(T)(T* object) {
    return cast(T*)obj_retain_imp(object);
}

T* obj_retain_optional(T)(T* object) {
    return cast(T*)obj_retain_optional_imp(object);
}

void obj_release(T)(T** object) {
    obj_release_imp(object);
}

void obj_release_optional(T)(T** object) {
    obj_release_optional_imp(object);
}

void obj_release_const_optional(T)(const T** object) {
    obj_release_optional_imp(cast(void**)object);
}

void obj_delete(T)(T** object) {
    obj_delete_imp(cast(byte_t**)object, T.sizeof, T.stringof);
}

Listener* obj_listener(T)(T* object, void function(T *obj, Event *event) func_event_handler) {
    obj_listener_imp(object, cast(FPtr_event_handler)(func_event_handler));
}
