 /** 
 * Keyboard buffer
 * 
 * See_Also: https://nappgui.com/en/core/keybuf.html
 */
module nappgui.core.keybuf;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

KeyBuf *keybuf_create();

void keybuf_destroy(KeyBuf **buffer);

void keybuf_OnUp(KeyBuf *buffer, const vkey_t key);

void keybuf_OnDown(KeyBuf *buffer, const vkey_t key);

void keybuf_clear(KeyBuf *buffer);

bool_t keybuf_pressed(const KeyBuf *buffer, const vkey_t key);

const(char_t)* keybuf_str(const vkey_t key);

void keybuf_dump(const KeyBuf *buffer);

