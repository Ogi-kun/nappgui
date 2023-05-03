/** Code assertion */
module nappgui.sewer.cassert;

import nappgui.config;
import nappgui.sewer.types;
import nappgui.sewer.sewer;

extern(C) @nogc nothrow:

void cassert_set_func(void *data, FPtr_assert func_assert);

void cassert_imp(bool_t cond, const char_t *detail, const char_t *file, uint32_t line);

void cassert_fatal_imp(bool_t cond, const char_t *detail, const char_t *file, uint32_t line);

void cassert_no_null_imp(void *ptr, const char_t *detail, const char_t *file, uint32_t line);

void cassert_no_nullf_imp(void function() ptr, const char_t *detail, const char_t *file, uint32_t line);

void cassert_default_imp(const char_t *file, uint32_t line);

static if (NAppGUI_NoAsserts) {
    void cassert()(bool_t cond, string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_msg()(bool_t cond, const char_t* msg, string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_fatal()(bool_t cond, string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_fatal_msg()(bool_t cond, const char_t* msg, string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_no_null()(void* ptr, string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_no_nullf()(void function() fptr, string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_default()(string file = __FILE__, uint32_t line = __LINE__) {
        /*noop*/
    }
    void cassert_unref()(string file = __FILE__, uint32_t line = __LINE__) { 
        /*noop*/
    }
    void cassert_unref(T)(bool cond, T v, string file = __FILE__, uint32_t line = __LINE__) { 
        /*noop*/
    }
}
else {

    void cassert()(bool_t cond, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_imp(cond, "", file.ptr, line);
    }
    void cassert_msg()(bool_t cond, const char_t* msg, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_imp(cond, msg, file.ptr, line);
    }

    void cassert_fatal()(bool_t cond, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_fatal_imp(cond, "", file.ptr, line);
    }
    void cassert_fatal_msg()(bool_t cond, const char_t* msg, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_fatal_imp(cond, msg, file.ptr, line);
    }

    void cassert_no_null()(void* ptr, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_no_null_imp(ptr, "", file.ptr, line);
    }

    void cassert_no_nullf()(void function() fptr, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_no_nullf_imp(fptr, "", file.ptr, line);
    }

    void cassert_default()(string file = __FILE__, uint32_t line = __LINE__) {
        cassert_default_imp(file.ptr, line);
    }

    void cassert_unref()(string file = __FILE__, uint32_t line = __LINE__) {
        cassert_default_imp(file.ptr, line);
    }

    void cassert_unref(T)(bool cond, T v, string file = __FILE__, uint32_t line = __LINE__) {
        cassert_imp(cond, "", file.ptr, line);
    }

}