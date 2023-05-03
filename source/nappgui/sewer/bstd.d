/** Basic standard functions */
module nappgui.sewer.bstd;

import nappgui.sewer.types;

import core.stdc.stdarg;

extern(C) @nogc nothrow:

//pragma(printf, 3, 4)
uint32_t bstd_sprintf(char_t *str, uint32_t size, const char_t *format, ...);

uint32_t bstd_vsprintf(char_t *str, uint32_t size, const char_t *format, va_list args);

pragma(printf)
uint32_t bstd_printf(const char_t *format, ...);

pragma(printf)
uint32_t bstd_eprintf(const char_t *format, ...);

uint32_t bstd_writef(const char_t *str);

uint32_t bstd_ewritef(const char_t *str);

bool_t bstd_read(byte_t *data, uint32_t size, uint32_t *rsize);

bool_t bstd_write(const byte_t *data, uint32_t size, uint32_t *wsize);

bool_t bstd_ewrite(const byte_t *data, uint32_t size, uint32_t *wsize);

