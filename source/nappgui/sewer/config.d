/// Project build config
module nappgui.sewer.config;

extern(C) @nogc nothrow:

version (X86) {
    enum PRIu64 = "llu";
    enum PRId64 = "lld";
}
else version (X86_64) {
    version (linux) {
        enum PRIu64 = "lu";
        enum PRId64 = "ld";
    }
    else {
        enum PRIu64 = "llu";
        enum PRId64 = "lld";
    }
}
else version (ARM) {
    enum PRIu64 = "llu";
    enum PRId64 = "lld";
}
else version (AArch64) {
    version (linux) {
        enum PRIu64 = "lu";
        enum PRId64 = "ld";
    }
    else {
        enum PRIu64 = "llu";
        enum PRId64 = "lld";
    }
}

version (Posix) {
    enum DIR_SEPARATOR = '/';
}
else version (Windows) {
    enum DIR_SEPARATOR = '\\';
}
else {
    static assert(0, "Unknown Platform");
}

/*! <32bits sizeof> */
enum uint32_t sizeof32(T) = cast(uint32_t)T.sizeof;

deprecated("Use `Struct.member.offsetof` instead`")
enum STRUCT_MEMBER_OFFSET(alias member) = member.offsetof;

deprecated("Use `Struct.member.sizeof` instead`")
enum STRUCT_MEMBER_SIZE(alias member) = member.sizeof;

deprecated("Use `static assert(is(typeof(Struct.member) == T))` instead`")
mixin template CHECK_STRUCT_MEMBER_TYPE(alias member, T) {
    alias M = typeof(member);
    static assert(is(M : T) || is(T : M));
}

/// Assigments
void unref(T)(T x) { cast(void)x; }

/// ditto
V PARAM(N, V)(N name, V value) { return value; }

/// Bit manipulation
void BIT_SET(T)(T data, size_t nbit) { data |= 1u << nbit; }
/// ditto
void BIT_CLEAR(T)(T data, size_t nbit) { data &= ~(1u << nbit); }
/// ditto
void BIT_TOGGLE(T)(T data, size_t nbit) { data ^= 1u << nbit; }
/// ditto
bool_t BIT_TEST(T)(T data, size_t nbit) { !!((data >> nbit) & 1u); }
