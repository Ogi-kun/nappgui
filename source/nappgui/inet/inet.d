/** 
 * inet library
 * 
 * See_Also: https://nappgui.com/en/inet/inet.html
 */
module nappgui.inet.inet;

import nappgui.config;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void inet_start();

void inet_finish();

enum ierror_t
{
    ekINONET = 1,
    ekINOHOST,
    ekITIMEOUT,
    ekISTREAM,
    ekISERVER,
    ekINOIMPL,
    ekIUNDEF,
    ekIOK
}
mixin ExpandEnum!ierror_t;

struct Url;
struct Http;
struct Json;

struct JsonOpts
{
    uint32_t not_used;
}