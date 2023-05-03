/** 
 * Fixed size memory buffers
 * 
 * See_Also: https://nappgui.com/en/core/buffer.html
 */
module nappgui.core.buffer;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Buffer *buffer_create(uint32_t size);

Buffer *buffer_with_data(const byte_t *data, uint32_t size);

void buffer_destroy(Buffer **buffer);

uint32_t buffer_size(const Buffer *buffer);

byte_t *buffer_data(Buffer *buffer);

const(byte_t)* buffer_const(const Buffer *buffer);

