/** 
 * Basic time services
 * 
 * See_Also: https://nappgui.com/en/osbs/btime.html
 */

module nappgui.osbs.btime;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

uint64_t btime_now();

void btime_date(Date *date);

uint64_t btime_to_micro(const Date *date);

void btime_to_date(uint64_t micro, Date *date);
