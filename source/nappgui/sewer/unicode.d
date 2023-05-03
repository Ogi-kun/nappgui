/**
 * Unicode
 * 
 * See_Also: https://nappgui.com/en/sewer/unicode.html
 */
module nappgui.sewer.unicode;

extern(C) @nogc nothrow:

import nappgui.sewer.types;
import nappgui.sewer.sewer;

uint32_t unicode_convers(const char_t *from_str, char_t *to_str, unicode_t from, unicode_t to, uint32_t osize);

uint32_t unicode_convers_n(const char_t *from_str, char_t *to_str, unicode_t from, unicode_t to, uint32_t isize, uint32_t osize);

uint32_t unicode_convers_nbytes(const char_t *str, unicode_t from, unicode_t to);

uint32_t unicode_nbytes(const char_t *str, unicode_t format);

uint32_t unicode_nchars(const char_t *str, unicode_t format);

uint32_t unicode_to_u32(const char_t *str, unicode_t format);

uint32_t unicode_to_u32b(const char_t *str, unicode_t format, uint32_t *bytes);

uint32_t unicode_to_char(uint32_t codepoint, char_t *str, unicode_t format);

bool_t unicode_valid_str(const char_t *str, unicode_t format);

bool_t unicode_valid_str_n(const char_t *str, uint32_t size, unicode_t format);

bool_t unicode_valid(uint32_t codepoint);

const(char_t)* unicode_next(const char_t *str, unicode_t format);

const(char_t)* unicode_back(const char_t *str, unicode_t format);

bool_t unicode_isascii(uint32_t codepoint);

bool_t unicode_isalnum(uint32_t codepoint);

bool_t unicode_isalpha(uint32_t codepoint);

bool_t unicode_iscntrl(uint32_t codepoint);

bool_t unicode_isdigit(uint32_t codepoint);

bool_t unicode_isgraph(uint32_t codepoint);

bool_t unicode_isprint(uint32_t codepoint);

bool_t unicode_ispunct(uint32_t codepoint);

bool_t unicode_isspace(uint32_t codepoint);

bool_t unicode_isxdigit(uint32_t codepoint);

bool_t unicode_islower(uint32_t codepoint);

bool_t unicode_isupper(uint32_t codepoint);

uint32_t unicode_tolower(uint32_t codepoint);

uint32_t unicode_toupper(uint32_t codepoint);

