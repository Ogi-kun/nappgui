/** 
 * Application runloop
 * 
 * See_Also: https://nappgui.com/en/osapp/osapp.html
 */
module nappgui.osapp.osapp;

import nappgui.gui.gui;
import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

void osapp_finish();

void osapp_task_imp(void *data, real32_t updtime, FPtr_task_main func_task_main, 
        FPtr_task_update func_task_update, FPtr_task_end func_task_end);

void osapp_menubar(Menu *menu, Window *window);

void osapp_open_url(const char_t *url);

void osapp_task(T)(T* data, real32_t updtime, uint32_t function(T* data) func_main, 
        void function(T* data) func_update, void function(void *data, uint32_t rvalue) func_end) {
    osapp_task_imp(data, updtime, cast(FPtr_task_main)func_main, 
            cast(FPtr_task_update)func_update, cast(FPtr_task_end)func_end);
}

alias FPtr_task_main = uint32_t function(void* data);
enum IS_TASK_MAIN_FUNC(alias fun, T) = is(typeof(&fun) : uint32_t function(T*));

deprecated("Use `static assert(IS_TASK_MAIN_FUNC!(fun, T))`")
void FUNC_CHECK_TASK_MAIN(alias fun, T)() { 
    static assert(IS_TASK_MAIN_FUNC!(fun, T)); 
}


alias FPtr_task_update = void function(void *data);
enum IS_TASK_UPDATE_FUNC(alias fun, T) = is(typeof(&fun) : void function(T*));

deprecated("Use `static assert(IS_TASK_UPDATE_FUNC!(fun, T))`")
void FUNC_CHECK_TASK_UPDATE(alias fun, T)() { 
    static assert(IS_TASK_UPDATE_FUNC!(fun, T)); 
}


alias FPtr_task_end = void function(void *data, uint32_t rvalue);
enum IS_TASK_END_FUNC(alias fun, T) = is(typeof(&fun) : void function(T*, uint32_t));

deprecated("Use `static assert(IS_TASK_END_FUNC!(fun, T))`")
void FUNC_CHECK_TASK_END(alias fun, T)() { 
    static assert(IS_TASK_END_FUNC!(fun, T)); 
}


