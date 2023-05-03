 /** 
 * Fast memory allocator and auditor
 * 
 * See_Also: https://nappgui.com/en/core/heap.html
 */

module nappgui.core.heap;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void heap_start_mt();

void heap_end_mt();

void heap_verbose(bool_t verbose);

void heap_stats(bool_t stats);

bool_t heap_leaks();

byte_t *heap_malloc_imp(uint32_t size, const char_t *name, bool_t equal_sized);

byte_t *heap_calloc_imp(uint32_t size, const char_t *name, bool_t equal_sized);

byte_t *heap_realloc(byte_t *mem, uint32_t size, uint32_t new_size, const char_t *name);

byte_t *heap_aligned_malloc_imp(uint32_t size, uint32_t align_, const char_t *name, bool_t equal_sized);

byte_t *heap_aligned_calloc_imp(uint32_t size, uint32_t align_, const char_t *name, bool_t equal_sized);

byte_t *heap_aligned_realloc(byte_t *mem, uint32_t size, uint32_t new_size, uint32_t align_, const char_t *name);

void heap_free(byte_t **mem, uint32_t size, const char_t *name);

void heap_auditor_add(const char_t *name);

void heap_auditor_delete(const char_t *name);


byte_t* heap_malloc()(uint32_t size, const char_t* name) {
    return heap_malloc_imp(size, name, false);
}

byte_t* heap_calloc()(uint32_t size, const char_t* name) {
    return heap_calloc_imp(size, name, false);
}

byte_t* heap_aligned_malloc()(uint32_t size, uint32_t align_, const char_t* name) {
    return heap_aligned_malloc_imp(size, align_, name, false);
}

byte_t* heap_aligned_calloc()(uint32_t size, uint32_t align_, const char_t* name) {
    return heap_aligned_calloc_imp(size, align_, name, false);
}

T* heap_new(T)() {
    return cast(T*)heap_malloc_imp(cast(uint32_t)T.sizeof, T.stringof, true);
}

T* heap_new0(T)() {
    return cast(T*)heap_calloc_imp(cast(uint32_t)T.sizeof, T.stringof, true);
}

T* heap_new_n(T)(uint32_t n) {
    enum name = T.stringof~HEAPARR;
    return cast(T*)heap_malloc_imp(cast(uint32_t)(T.sizeof*n), name, true);
}

T* heap_new_n0(T)(uint32_t n) {
    enum name = T.stringof~HEAPARR;
    return cast(T*)heap_calloc_imp(cast(uint32_t)(T.sizeof*n), name, true);
}

T* heap_realloc_n(T)(T* mem, uint32_t size, uint32_t new_size) {
    enum name = T.stringof~HEAPARR;
    return cast(T*)heap_realloc(cast(byte_t*)mem, size * cast(uint32_t)T.sizeof, 
            new_size * cast(uint32_t)T.sizeof, name);
}

void heap_delete(T)(T** obj) {
    heap_free(cast(byte_t**)obj, cast(uint32_t)T.sizeof, T.stringof);
}

void heap_delete_n(T)(T** objs, uint32_t n) {
    enum name = T.stringof~HEAPARR;
    heap_free(cast(byte_t**)objs, cast(uint32_t)(T.sizeof*n), name);
}

