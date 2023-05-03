/* 
* Undocumented (hidden) API to use DBind database 
* 
* StBind = Data binding with struct type
* DBind = Data binding with struct member
* 
*/

module nappgui.core.dbindh;

import nappgui.config;
import nappgui.core.core;
import nappgui.core.coreh;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void dbind_opaque_imp(const char_t *type, FPtr_data func_data, FPtr_buffer func_buffer, 
        FPtr_copy func_copy, FPtr_read func_read, FPtr_write func_write, FPtr_destroy func_destroy);

void dbind_opaque_destroy(const char_t *object_type);

dtype_t dbind_data_type(const char_t *type, String **subtype, uint16_t *size);


const(StBind)* dbind_stbind(const char_t *type);

const(char_t)* dbind_stbind_type(const StBind *stbind);

uint16_t dbind_stbind_sizeof(const StBind *stbind);

uint32_t dbind_stbind_count(const StBind *stbind);

const(DBind)* dbind_stbind_member(const StBind *stbind, uint32_t i);

const(DBind)* dbind_stbind_find(const StBind *stbind, const char_t *name);

void dbind_stbind_opaque(const StBind *stbind, const byte_t *data, uint32_t size, void **obj);

void dbind_stbind_opaque_upd(const StBind *stbind, void *new_obj, void **obj);


dtype_t dbind_type(const DBind *dbind);

const(char_t)* dbind_name(const DBind *dbind);

uint16_t dbind_offset(const DBind *dbind);

uint16_t dbind_sizeof(const DBind *dbind);

const(char_t)* dbind_subtype(const DBind *dbind);

const(StBind)* dbind_get_stbind(const DBind *dbind);

const(char_t)* dbind_real32_format(const DBind *dbind);

const(char_t)* dbind_real64_format(const DBind *dbind);

void dbind_real32_range(const DBind *dbind, real32_t *min, real32_t *max);

void dbind_real64_range(const DBind *dbind, real64_t *min, real64_t *max);

void dbind_int8_range(const DBind *dbind, int8_t *min, int8_t *max);

void dbind_int16_range(const DBind *dbind, int16_t *min, int16_t *max);

void dbind_int32_range(const DBind *dbind, int32_t *min, int32_t *max);

void dbind_int64_range(const DBind *dbind, int64_t *min, int64_t *max);

void dbind_uint8_range(const DBind *dbind, uint8_t *min, uint8_t *max);

void dbind_uint16_range(const DBind *dbind, uint16_t *min, uint16_t *max);

void dbind_uint32_range(const DBind *dbind, uint32_t *min, uint32_t *max);

void dbind_uint64_range(const DBind *dbind, uint64_t *min, uint64_t *max);

real32_t dbind_real32(const DBind *dbind, real32_t value);

real64_t dbind_real64(const DBind *dbind, real64_t value);

int8_t dbind_int8(const DBind *dbind, int8_t value);

int16_t dbind_int16(const DBind* dbind, int16_t value);

int32_t dbind_int32(const DBind* dbind, int32_t value);

int64_t dbind_int64(const DBind* dbind, int64_t value);

uint8_t dbind_uint8(const DBind* dbind, uint8_t value);

uint16_t dbind_uint16(const DBind* dbind, uint16_t value);

uint32_t dbind_uint32(const DBind* dbind, uint32_t value);

uint64_t dbind_uint64(const DBind* dbind, uint64_t value);

real32_t dbind_incr_real32(const DBind *dbind, real32_t value, bool_t pos);

real64_t dbind_incr_real64(const DBind *dbind, real64_t value, bool_t pos);

int8_t dbind_incr_int8(const DBind *dbind, int8_t value, bool_t pos);

int16_t dbind_incr_int16(const DBind *dbind, int16_t value, bool_t pos);

int32_t dbind_incr_int32(const DBind *dbind, int32_t value, bool_t pos);

int64_t dbind_incr_int64(const DBind *dbind, int64_t value, bool_t pos);

uint8_t dbind_incr_uint8(const DBind *dbind, uint8_t value, bool_t pos);

uint16_t dbind_incr_uint16(const DBind *dbind, uint16_t value, bool_t pos);

uint32_t dbind_incr_uint32(const DBind *dbind, uint32_t value, bool_t pos);

uint64_t dbind_incr_uint64(const DBind *dbind, uint64_t value, bool_t pos);

bool_t dbind_string_filter(const DBind *dbind, const char_t *src, char_t *dest, uint32_t size);

real32_t dbind_string_to_real32(const DBind *dbind, real32_t value, const char_t *src);

real64_t dbind_string_to_real64(const DBind *dbind, real64_t value, const char_t *src);

int8_t dbind_string_to_int8(const DBind *dbind, int8_t value, const char_t *src);

int16_t dbind_string_to_int16(const DBind *dbind, int16_t value, const char_t *src);

int32_t dbind_string_to_int32(const DBind *dbind, int32_t value, const char_t *src);

int64_t dbind_string_to_int64(const DBind *dbind, int64_t value, const char_t *src);

uint8_t dbind_string_to_uint8(const DBind *dbind, uint8_t value, const char_t *src);

uint16_t dbind_string_to_uint16(const DBind *dbind, uint16_t value, const char_t *src);

uint32_t dbind_string_to_uint32(const DBind *dbind, uint32_t value, const char_t *src);

uint64_t dbind_string_to_uint64(const DBind *dbind, uint64_t value, const char_t *src);

void* dbind_opaque_default(const DBind *dbind);

bool_t dbind_is_basic_type(const DBind* dbind);

bool_t dbind_is_number_type(const DBind *dbind);

uint32_t dbind_enum_count(const DBind *dbind);

enum_t dbind_enum_value(const DBind *dbind, uint32_t index);

const(char_t)* dbind_enum_alias(const DBind *dbind, uint32_t index);

uint32_t dbind_enum_index(const DBind *dbind, enum_t value);


void dbind_opaque(T)(
        T* function(const byte_t *data, uint32_t size) func_data,
        Buffer* function(const T *obj) func_buffer,
        T* function(const T* item) func_copy,
        T* function(Stream *stream) func_read,
        void function(Stream *stream, const T* obj) func_write,
        void function(T** item) func_destroy) {
    dbind_opaque_imp(
            T.stringof,
            cast(FPtr_data)func_data,
            cast(FPtr_buffer)func_buffer,
            cast(FPtr_copy)func_copy,
            cast(FPtr_read)func_read,
            cast(FPtr_write)func_write,
            cast(FPtr_destroy)func_destroy);
}
