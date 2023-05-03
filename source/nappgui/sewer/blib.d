/** C library funcions */
module nappgui.sewer.blib;

import nappgui.sewer.types;
import nappgui.sewer.sewer;

extern(C) @nogc nothrow:

uint32_t blib_strlen(const char_t *str);

char_t* blib_strstr(const char_t *str, const char_t *substr);

void blib_strcpy(char_t *dest, uint32_t size, const char_t *src);

void blib_strncpy(char_t *dest, uint32_t size, const char_t *src, uint32_t n);

void blib_strcat(char_t *dest, uint32_t size, const char_t *src);

int blib_strcmp(const char_t *str1, const char_t *str2);

int blib_strncmp(const char_t *str1, const char_t *str2, uint32_t n);

int64_t blib_strtol(const char_t* str, char_t** endptr, uint32_t base, bool_t *err);

uint64_t blib_strtoul(const char_t* str, char_t** endptr, uint32_t base, bool_t *err);

real32_t blib_strtof(const char_t* str, char_t** endptr, bool_t *err);

real64_t blib_strtod(const char_t* str, char_t** endptr, bool_t *err);

void blib_qsort(byte_t *array, uint32_t nelems, 
        uint32_t size, FPtr_compare func_compare);

void blib_qsort_ex(const byte_t *array, uint32_t nelems, uint32_t size, 
        FPtr_compare_ex func_compare, const byte_t *data);

bool_t blib_bsearch(const byte_t *array, const byte_t *key, uint32_t nelems, 
        uint32_t size, FPtr_compare func_compare, uint32_t *pos);

bool_t blib_bsearch_ex(const byte_t *array, const byte_t *key, uint32_t nelems, 
        uint32_t size, FPtr_compare_ex func_compare, const byte_t *data, uint32_t *pos);

void blib_atexit(void function() func);

void blib_abort();

void blib_debug_break();

