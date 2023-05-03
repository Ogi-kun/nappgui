/** 
 * Data binding
 * 
 * See_Also: https://nappgui.com/en/core/dbind.html
 */

module nappgui.core.dbind;

import nappgui.config;
import nappgui.core.core;
import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void dbind_imp(const char_t *type, uint16_t size, const char_t *mname, const char_t *mtype, uint16_t moffset, uint16_t msize);

void dbind_enum_imp(const char_t *type, const char_t *name, enum_t value, const char_t *alias_);

byte_t *dbind_create_imp(const char_t *type);

void dbind_init_imp(byte_t *data, const char_t *type);

void dbind_remove_imp(byte_t *data, const char_t *type);

void dbind_destroy_imp(byte_t **data, const char_t *type);

void dbind_destopt_imp(byte_t **data, const char_t *type);

void *dbind_read_imp(Stream *stm, const char_t *type);

void dbind_write_imp(Stream *stm, const void *data, const char_t *type);

void dbind_default_imp(const char_t *type, const char_t *mname, const void *value);

void dbind_range_imp(const char_t *type, const char_t *mname, const void *min, const void *max);

void dbind_precision_imp(const char_t *type, const char_t *mname, const void *prec);

void dbind_increment_imp(const char_t *type, const char_t *mname, const void *incr);

void dbind_suffix_imp(const char_t *type, const char_t *mname, const char_t *suffix);


void dbind(S, string fieldName)() 
if (is(S == struct))
{
    enum s = S.init;
    dbind_imp(
            S.stringof,
            cast(uint16_t)S.sizeof,
            fieldName,
            typeof(__traits(getMember, s, fieldName)).stringof,
            cast(uint16_t)__traits(getMember, s, fieldName).offsetof,
            cast(uint16_t)__traits(getMember, s, fieldName).sizeof
    );
}

void dbind_enum(alias e, string alias_ = "")() 
if (is(typeof(e) == enum) && is(typeof(e) : int))
{
    alias E = typeof(e);
    enum enumValueName = 
    dbind_enum_imp(
            E.stringof,
            enumName!e,
            cast(enum_t)e,
            alias_
    );
}

T* dbind_create(T)() {
    return cast(T*)dbind_create_imp(T.stringof);
}

void dbind_init(T)(T* data) {
    dbind_init_imp(cast(byte_t*)data, T.stringof);
}

void dbind_remove(T)(T* data) {
    dbind_remove_imp(cast(byte_t*)data, T.stringof);
}

void dbind_destroy(T)(T* data) {
    dbind_destroy_imp(cast(byte_t*)data, T.stringof);
}

void dbind_destopt(T)(T* data) {
    dbind_destopt_imp(cast(byte_t*)data, T.stringof);
}

T* dbind_read(T)(Stream *stm) {
    return cast(T*)dbind_read_imp(stm, T.stringof);
}

void dbind_write(T)(Stream *stm, T* data) {
    dbind_write_imp(stm, data, T.stringof);
}

void dbind_default(T)(Stream *stm, T* data) {
    dbind_write_imp(stm, data, T.stringof);
}

void dbind_default(
    S, 
    string fieldName, 
    T : typeof(__traits(getMember, S.init, fieldName))
)(const T value) 
{
    dbind_default_imp(S.stringof, fieldName, &value);
}

void dbind_range(
    S, 
    string fieldName, 
    T : typeof(__traits(getMember, S.init, fieldName))
)(const T min, const T max) 
{
    dbind_range_imp(S.stringof, fieldName, &min, &max);
}

void dbind_precision(
    S, 
    string fieldName, 
    T : typeof(__traits(getMember, S.init, fieldName))
)(const T prec) 
{
    dbind_precision_imp(S.stringof, fieldName, &prec);
}

void dbind_increment(
    S, 
    string fieldName, 
    T : typeof(__traits(getMember, S.init, fieldName))
)(const T prec) 
{
    dbind_increment(S.stringof, fieldName, &prec);
}

void dbind_suffix(
    S, 
    string fieldName,
)(const char_t* suffix) 
{
    static assert(is(typeof(__traits(getMember, S.init, fieldName))));
    dbind_suffix_imp(S.stringof, fieldName, &prec);
}


private template enumName(alias e) 
if (is(typeof(e) == enum))
{
    /* 
    Alias templates are weird: `e.stringof` can yield `e` or `E.e`. 
    We will force it to be `E.e` and strip the `E.` part.
    */
    enum e_ = e;
    enum enumName = e_.stringof[typeof(e).stringof.length+1 .. $];
}
