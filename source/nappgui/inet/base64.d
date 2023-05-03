/** 
 * Base64 encoding
 * 
 * See_Also: https://nappgui.com/en/inet/base64.html
 */
module nappgui.inet.base64;

import nappgui.sewer.types;

extern(C) @nogc nothrow:

uint32_t b64_encoded_size(uint32_t data_size);

uint32_t b64_decoded_size(uint32_t encoded_size);

uint32_t b64_encode(const byte_t *data, uint32_t size, char_t *base64, uint32_t esize);

uint32_t b64_decode(const char_t *base64, uint32_t size, byte_t *data);
