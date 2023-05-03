/** Sewer library */
module nappgui.sewer.sewer;

import nappgui.config;
import nappgui.sewer.config;
import nappgui.sewer.types;

enum unicode_t {
    ekUTF8,
    ekUTF16,
    ekUTF32
}
mixin ExpandEnum!unicode_t;

struct REnv;

version (NAppGUI_NoGC_Callbacks) {
    extern(C) nothrow @nogc mixin Callbacks;
}
else { 
    extern(C) nothrow mixin Callbacks; 
}
private mixin template Callbacks() {
    alias FPtr_destroy = void function(void **item);
    enum IS_DESTROY_FUNC(alias fun, T) = is(typeof(&fun) : void function(T**));

    alias FPtr_copy = void* function(const void *item);
    enum IS_COPY_FUNC(alias fun, T) = is(typeof(&fun) : T* function(const T*));

    alias FPtr_scopy = void function(void *dest, const void *src);
    enum IS_SCOPY_FUNC(alias fun, T) = is(typeof(&fun) : void function(T*, const T*));

    alias FPtr_compare = int function(const void *item1, const void *item2);
    alias IS_COMPARE_FUNC(alias fun, T) = IS_COMPARE_FUNC!(fun, T, T);
    enum IS_COMPARE_FUNC(alias fun, T, K) = is(typeof(&fun) : int function(const T*, const K*));

    alias FPtr_compare_ex = int function(const void *item1, const void *item2, const void *data);
    enum IS_COMPARE_FUNC_EX(alias fun, T, D) = is(typeof(&fun) : int function(const T*, const T*, const D*));


    alias FPtr_assert = void function(void *item, uint32_t group, 
            const char_t *caption, const char_t *detail, const char_t *file, uint32_t line);
    enum IS_ASSERT_FUNC(alias fun, T) = is(typeof(&fun) : void function(
            T*, uint32_t, const char_t*, const char_t*, const char_t*, const uint32_t));
}

deprecated("Use `static assert(IS_DESTROY_FUNC!(fun, T))`")
void FUNC_CHECK_DESTROY(alias fun, T)() { 
    static assert(IS_DESTROY_FUNC!(fun, T)); 
}

deprecated("Use `static assert(IS_COPY_FUNC!(fun, T))`")
void FUNC_CHECK_COPY(alias fun, T)() { 
    static assert(IS_COPY_FUNC!(fun, T)); 
}

deprecated("Use `static assert(IS_SCOPY_FUNC!(fun, T))`")
void FUNC_CHECK_SCOPY(alias fun, T)() { 
    static assert(IS_SCOPY_FUNC!(fun, T)); 
}

deprecated("Use `static assert(IS_COMPARE_FUNC!(fun, T))`")
void FUNC_CHECK_COMPARE(alias fun, T)() { 
    static assert(IS_COMPARE_FUNC!(fun, T)); 
}

deprecated("Use `static assert(IS_COMPARE_FUNC!(fun, T, K))`")
void FUNC_CHECK_COMPARE_KEY(alias fun, T, K)() { 
    static assert(IS_COMPARE_FUNC!(fun, T, K)); 
}

deprecated("Use `static assert(IS_COMPARE_FUNC_EX!(fun, T, D))`")
void FUNC_CHECK_COMPARE_EX(alias fun, T, D)() { 
    static assert(IS_COMPARE_FUNC_EX!(fun, T, D)); 
}

deprecated("Use `static assert(IS_ASSERT_FUNC!(fun, T))`")
void FUNC_CHECK_ASSERT_FUNC(alias fun, T)() { 
    static assert(IS_ASSERT_FUNC!(fun, T)); 
}

extern(C) @nogc nothrow:
void sewer_start();
void sewer_finish();
