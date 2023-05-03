 /** 
 * Resource Packages
 * 
 * See_Also: https://nappgui.com/en/core/respack.html
 */
module nappgui.core.respack;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void respack_destroy(ResPack **pack);

const(char_t)* respack_text(const ResPack *pack, const ResId id);

const(byte_t)* respack_file(const ResPack *pack, const ResId id, uint32_t *size);
