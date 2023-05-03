/** 
 * Basic synchronization services
 * 
 * See_Also: https://nappgui.com/en/osbs/bmutex.html
 */

module nappgui.osbs.bmutex;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Mutex *bmutex_create();

void bmutex_close(Mutex **mutex);

void bmutex_lock(Mutex *mutex);

void bmutex_unlock(Mutex *mutex);
