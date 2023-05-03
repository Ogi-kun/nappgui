/** 
 * Manages an application log
 * 
 * See_Also: https://nappgui.com/en/osbs/log.html
 */

module nappgui.osbs.log;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

pragma(printf)
uint32_t log_printf(const char_t *format, ...);

void log_output(bool_t std, bool_t err);

void log_file(const char_t *pathname);

const(char_t)* log_get_file();

