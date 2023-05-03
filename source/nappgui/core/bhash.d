/** 
 * Hash code from memory block 
 */
module nappgui.core.bhash;

import nappgui.config;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

uint32_t bhash_from_block(const byte_t *data, uint32_t size);

uint32_t bhash_append_uint32(uint32_t hash, uint32_t value); 

uint32_t bhash_append_real32(uint32_t hash, real32_t value);


uint32_t bhash_from_object(T)(T* data) {
    return bhash_from_block(cast(const byte_t*)data, T.sizeof);
}

uint32_t bhash_append_enum(E)(uint32_t hash, E value) 
if (is(E == enum))
{
    bhash_append_uint32(hash, cast(uint32_t)value);
}
