/** Dynamic library loading */

module nappgui.osbs.dlib;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

DLib *dlib_open(const char_t *path, const char_t *libname);

void dlib_close(DLib **dlib);

FPtr_libproc dlib_proc_imp(DLib *dlib, const char_t *procname);

void* dlib_var_imp(DLib *dlib, const char_t *varname);

T dlib_proc(T)(DLib *dlib, const char_t *procname) {
    return cast(T)dlib_proc_imp(dlib, procname);
}

const(T)* dlib_proc(T)(DLib *dlib, const char_t *varname) {
    return cast(const T*)dlib_var_imp(dlib, procname);
}
