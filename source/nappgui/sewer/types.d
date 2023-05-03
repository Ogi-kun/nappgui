/** Types */
module nappgui.sewer.types;

public import std.stdint;

import nappgui.config;

extern(C) @nogc nothrow:

alias char_t = char;
alias byte_t = byte;
alias bool_t = bool;
alias real32_t = float;
alias real64_t = double;

enum REAL32_MAX = 1e+20f;
enum REAL64_MAX = 1e+38;
enum REAL32_MIN = 1e-20f;
enum REAL64_MIN = 1e-38;

enum ENUM_MAX(T) = cast(T)INT32_MAX;

enum bool_t FALSE = 0;
enum bool_t TRUE = 1;

enum enum_t {
    ekENUM_GENERIC_VALUE
}
mixin ExpandEnum!enum_t;

T max_val(T)(T x, T y) { return x > y ? x : y; }
T min_val(T)(T x, T y) { return x < y ? x : y; }

uint32_t min_u32(uint32_t v1, uint32_t v2);
real32_t min_r32(real32_t v1, real32_t v2);
real64_t min_r64(real64_t v1, real64_t v2);
uint32_t max_u32(uint32_t v1, uint32_t v2);
real32_t max_r32(real32_t v1, real32_t v2);
real64_t max_r64(real64_t v1, real64_t v2);
real32_t abs_r32(real32_t v);
uint8_t to_u8(uint32_t v);