 /** 
 * Data streams
 * 
 * See_Also: https://nappgui.com/en/core/stream.html
 */
module nappgui.core.stream;

import nappgui.config;
import nappgui.core.core;
import nappgui.osbs.osbs;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Stream *stm_from_block(const byte_t *data, uint32_t size);

Stream *stm_memory(uint32_t size);

Stream *stm_from_file(const char_t *pathname, ferror_t *error);

Stream *stm_to_file(const char_t *pathname, ferror_t *error);

Stream *stm_append_file(const char_t *pathname, ferror_t *error);

Stream *stm_socket(Socket *socket);

void stm_close(Stream **stm);


endian_t stm_get_write_endian(const Stream *stm);

endian_t stm_get_read_endian(const Stream *stm);

void stm_set_write_endian(Stream *stm, const endian_t endian);

void stm_set_read_endian(Stream *stm, const endian_t endian);

unicode_t stm_get_write_utf(const Stream *stm);

unicode_t stm_get_read_utf(const Stream *stm);

void stm_set_write_utf(Stream *stm, unicode_t format);

void stm_set_read_utf(Stream *stm, unicode_t format);

bool_t stm_is_memory(const Stream *stm);

uint64_t stm_bytes_written(const Stream *stm);

uint64_t stm_bytes_readed(const Stream *stm);

uint32_t stm_col(const Stream *stm);

uint32_t stm_row(const Stream *stm);

uint32_t stm_token_col(const Stream *stm);

uint32_t stm_token_row(const Stream *stm);

const(char_t)* stm_token_lexeme(const Stream *stm, uint32_t *size);

void stm_token_escapes(Stream *stm, bool_t active_escapes);

void stm_token_spaces(Stream *stm, bool_t active_spaces);

void stm_token_comments(Stream *stm, bool_t active_comments);

sstate_t stm_state(const Stream *stm);

ferror_t stm_file_err(const Stream *stm);

serror_t stm_sock_err(const Stream *stm);

void stm_corrupt(Stream *stm);

String *stm_str(const Stream *stm);

const(byte_t)* stm_buffer(const Stream *stm);

uint32_t stm_buffer_size(const Stream *stm);


void stm_write(Stream *stm, const byte_t *data, uint32_t size);

void stm_write_char(Stream *stm, uint32_t codepoint);

uint32_t stm_printf(Stream *stm, const char_t *format, ...);

uint32_t stm_writef(Stream *stm, const char_t *str);

void stm_write_bool(Stream *stm, bool_t value);

void stm_write_i8(Stream *stm, int8_t value);

void stm_write_i16(Stream *stm, int16_t value);

void stm_write_i32(Stream *stm, int32_t value);

void stm_write_i64(Stream *stm, int64_t value);

void stm_write_u8(Stream *stm, uint8_t value);

void stm_write_u16(Stream *stm, uint16_t value);

void stm_write_u32(Stream *stm, uint32_t value);

void stm_write_u64(Stream *stm, uint64_t value);

void stm_write_r32(Stream *stm, real32_t value);

void stm_write_r64(Stream *stm, real64_t value);


uint32_t stm_read(Stream *stm, byte_t *data, uint32_t size);

uint32_t stm_read_char(Stream *stm);

const(char_t)* stm_read_chars(Stream *stm, uint32_t n);

const(char_t)* stm_read_line(Stream *stm);

const(char_t)* stm_read_trim(Stream *stm);

ltoken_t stm_read_token(Stream *stm);

int8_t stm_read_i8_tok(Stream *stm);

int16_t stm_read_i16_tok(Stream *stm);

int32_t stm_read_i32_tok(Stream *stm);

int64_t stm_read_i64_tok(Stream *stm);

uint8_t stm_read_u8_tok(Stream *stm);

uint16_t stm_read_u16_tok(Stream *stm);

uint32_t stm_read_u32_tok(Stream *stm);

uint64_t stm_read_u64_tok(Stream *stm);

real32_t stm_read_r32_tok(Stream *stm);

real64_t stm_read_r64_tok(Stream *stm);


bool_t stm_read_bool(Stream *stm);

int8_t stm_read_i8(Stream *stm);

int16_t stm_read_i16(Stream *stm);

int32_t stm_read_i32(Stream *stm);

int64_t stm_read_i64(Stream *stm);

uint8_t stm_read_u8(Stream *stm);

uint16_t stm_read_u16(Stream *stm);

uint32_t stm_read_u32(Stream *stm);

uint64_t stm_read_u64(Stream *stm);

real32_t stm_read_r32(Stream *stm);

real64_t stm_read_r64(Stream *stm);


void stm_skip(Stream *stm, uint32_t size);

void stm_skip_bom(Stream *stm);

void stm_skip_token(Stream *stm, const ltoken_t token);

void stm_flush(Stream *stm);

void stm_pipe(Stream *from, Stream *to, uint32_t n);

extern export __gshared Stream* kSTDIN, kSTDOUT, kSTDERR, kDEVNULL;

void stm_write_enum(E)(Stream* stm, E value) {
    stm_write_i32(stm, cast(int32_t)value);
}

E stm_read_enum(E)(Stream* stm) {
    return cast(E)stm_read_i32(stm);
}

// Replacement for stm_lines
auto stm_line_splitter()(Stream* stm) {
    struct Range {
        Stream* stm;
        const(char_t)* _front;

        const(char_t)* front() const { return _front; }
        void popFront() { _front = stm_read_line(stm); }
        bool empty() const { return _front is null; }
    }
    return Range(stm, stm_read_line(stm));
}
