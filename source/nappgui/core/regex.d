 /** 
 * Regular expresions
 * 
 * See_Also: https://nappgui.com/en/core/regex.html
 */
module nappgui.core.regex;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

RegEx *regex_create(const char_t *pattern);

void regex_destroy(RegEx **regex);

bool_t regex_match(const RegEx *regex, const char_t *str);
