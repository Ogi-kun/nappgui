/** Operating System memory support */
module nappgui.sewer.bmem;

import nappgui.sewer.types;

extern(C) @nogc nothrow:

byte_t* bmem_aligned_malloc(uint32_t size, uint32_t align_);

byte_t* bmem_aligned_realloc(byte_t *mem, uint32_t size, uint32_t new_size, uint32_t align_);

void bmem_free(byte_t *mem);

void bmem_set1(byte_t *dest, uint32_t size, const byte_t mask);

void bmem_set4(byte_t *dest, uint32_t size, const byte_t *mask);

void bmem_set8(byte_t *dest, uint32_t size, const byte_t *mask);

void bmem_set16(byte_t *dest, uint32_t size, const byte_t *mask);

int bmem_cmp(const byte_t *mem1, const byte_t *mem2, uint32_t size);

bool_t bmem_is_zero(const byte_t *mem, uint32_t size);

void bmem_set_zero(byte_t *dest, uint32_t size);

void bmem_copy(byte_t *dest, const byte_t *src, uint32_t size);

void bmem_move(byte_t *dest, const byte_t *src, uint32_t size);

bool_t bmem_overlaps(const byte_t *mem1, const byte_t *mem2, uint32_t size1, uint32_t size2);

void bmem_rev(byte_t *mem, uint32_t size);

void bmem_rev2(byte_t *mem);

void bmem_rev4(byte_t *mem);

void bmem_rev8(byte_t *mem);

void bmem_revcopy(byte_t *dest, const byte_t *src, uint32_t size);

void bmem_rev_elems_imp(byte_t *data, uint32_t num_elems, uint32_t elem_size);

void bmem_swap(byte_t *mem1, byte_t *mem2, uint32_t size);

void bmem_shuffle(byte_t *mem, uint32_t size, uint32_t esize);

byte_t* bmem_malloc()(uint32_t size) {
    return bmem_aligned_malloc(size, cast(uint32_t)(void*).sizeof);
}

byte_t* bmem_realloc()(byte_t* mem, uint32_t size, uint32_t new_size) {
    bmem_aligned_realloc(mem, size, new_size, cast(uint32_t)(void*).sizeof);
}

void bmem_set_u32()(uint32_t* dest, uint32_t n, uint32_t value) {
    bmem_set4(cast(byte_t*)dest, cast(uint32_t)uint32_t.sizeof * n, cast(const byte_t*)&value); 
}

void bmem_set_r32()(real32_t* dest, uint32_t n, real32_t value) {
    bmem_set4(cast(byte_t*)dest, cast(uint32_t)real32_t.sizeof * n, cast(const byte_t*)&value); 
}

void bmem_zero(T)(T* dest) {
    bmem_set_zero(cast(byte_t*)dest, cast(uint32_t)T.sizeof);
}

void bmem_zero_n(T)(T* dest, uint32_t n) {
    bmem_set_zero(cast(byte_t*)dest, n * cast(uint32_t)T.sizeof);
}

void bmem_copy_n(T)(T* dest, const T* src, uint32_t n) {
    bmem_copy(cast(byte_t*)dest, cast(const byte_t*)src, cast(uint32_t)T.sizeof * n);
}

void bmem_rev_elems(T)(T* elems, uint32_t n) {
    bmem_rev_elems_imp(cast(byte_t*)elems, n, cast(uint32_t)T.sizeof);
}

void bmem_swap_type(T)(T* obj1, T* obj2) {
    bmem_swap(cast(byte_t*)(obj1), cast(byte_t*)(obj2), cast(uint32_t)T.sizeof);
}

void bmem_shuffle_n(T)(T* arr, uint32_t size){
    bmem_shuffle(cast(byte_t*)arr, size, cast(uint32_t)T.sizeof);
}
