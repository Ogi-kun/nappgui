/**
 * Safety pointer manipulation
 * 
 * See_Also: https://nappgui.com/en/sewer/ptr.html
 */

module nappgui.sewer.ptr;

import nappgui.config;
import nappgui.sewer.sewer;

extern(C) @nogc nothrow:

void *ptr_dget_imp(void **dptr);

void *ptr_dget_no_null_imp(void **dptr);

void ptr_destopt_imp(void **dptr, FPtr_destroy func_destroy);

void *ptr_copyopt_imp(void *ptr, FPtr_copy func_copy);

T ptr_get(T)(T* ptr) {
    static if (!NAppGUI_NoAsserts) {
        cassert_no_null(ptr);
    }
    return *ptr;
}

T* ptr_dget(T)(T** dptr) {
    return cast(T*)ptr_dget_imp(cast(void**)dptr);
}

T* ptr_dget_no_null(T)(T** dptr) {
    return cast(T*)ptr_dget_no_null_imp(cast(void**)dptr);
}

void ptr_assign(T)(T* dest, T src) {
    if (dest !is null) { *dest = src; }
}

void ptr_destopt(T)(void function(T*) func_destroy, T** dptr) {
    ptr_destopt_imp(cast(void**)dptr, cast(FPtr_destroy)func_destroy);
}

T* ptr_copyopt(T)(T* function(const T*) func_copy, T* ptr) {
    return ptr_copyopt_imp(cast(void*)ptr, cast(FPtr_copy)func_copy);
}
