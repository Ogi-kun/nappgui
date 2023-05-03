/** 
 * Basic threading services
 * 
 * See_Also: https://nappgui.com/en/osbs/bthread.html
 */

module nappgui.osbs.bthread;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Thread *bthread_create_imp(FPtr_thread_main thmain, void *data);

int bthread_current_id();

void bthread_close(Thread **thread);

bool_t bthread_cancel(Thread *thread);

uint32_t bthread_wait(Thread *thread);

bool_t bthread_finish(Thread *thread, uint32_t *code);

void bthread_sleep(uint32_t milliseconds);

void bthread_create(T)(uint32_t function(T*) thmain, T* data) {
    bthread_create_imp(cast(FPtr_thread_main)thmain, data);
}
