/**
 * Json parser
 * 
 * See_Also: https://nappgui.com/en/inet/json.html
 */
module nappgui.inet.json;

import nappgui.inet.inet;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void* json_read_imp(Stream *stm, const JsonOpts *opts, const char_t *type);

void json_write_imp(Stream *stm, const void *data, const JsonOpts *opts, const char_t *type);

void json_destroy_imp(void **data, const char_t *type);

void json_destopt_imp(void **data, const char_t *type);

T* json_read(T)(Stream* stm, const JsonOpts* opts) {
    return cast(T*)json_read_imp(stm, opts, T.stringof);
}

void json_write(T)(Stream* stm, const T* data, const JsonOpts * opts) {
    json_write_imp(stm, data, opts, T.stringof);
}

void json_destroy(T)(T** data) {
    json_destroy_imp(cast(void**)data, T.stringof);
}

void json_destopt(T)(T** data) {
    json_destopt_imp(cast(void**)data, T.stringof);
}
