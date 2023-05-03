/* Cross-platform main */

module nappgui.osapp.osmain;

import nappgui.sewer.sewer;
import nappgui.sewer.types;

version (NAppGUI_NoGC_Callbacks) {
    extern(C) nothrow @nogc mixin Callbacks;
}
else { 
    extern(C) nothrow mixin Callbacks; 
}
private mixin template Callbacks() {
    alias FPtr_app_create = void* function();
    enum IS_APP_CREATE_FUNC(alias fun, T) = is(typeof(&fun) : T* function());

    deprecated("Use `static assert(IS_APP_CREATE_FUNC!(fun, T))`")
    void FUNC_CHECK_APP_CREATE(alias fun, T)() { 
        static assert(IS_APP_CREATE_FUNC!(fun, T)); 
    }

    alias FPtr_app_update = void function(void *app, real64_t prtime, real64_t ctime);
    enum IS_APP_UPDATE_FUNC(alias fun, T) = is(typeof(&fun) : void function(T*, real64_t, real64_t));

    deprecated("Use `static assert(IS_APP_UPDATE_FUNC!(fun, T))`")
    void FUNC_CHECK_APP_UPDATE(alias fun, T)() { 
        static assert(IS_APP_UPDATE_FUNC!(fun, T)); 
    }

    alias AppCreateFun(T) = T* function();
    alias AppDestroyFun(T) = void function(T**);
    alias AppUpdateFun(T) = void function(T*, real64_t, real64_t);

    extern(C) void osmain_helper(App)(int argc, char_t **argv, void *instance, 
            App* function() func_create, void function(App**) func_destroy,
            const char *options,
            double lframe = 0.0, 
            void function(App*, real64_t, real64_t) func_update = null) {
        osmain_imp(cast(uint32_t)argc, argv, instance, 
                lframe, cast(FPtr_app_create)func_create,
                cast(FPtr_app_update)func_update, cast(FPtr_destroy) func_destroy, 
                cast(char_t*)options);
    }
}

extern(C) void osmain_imp(uint32_t argc, char_t **argv, void *instance, 
        real64_t lframe, FPtr_app_create func_create, 
        FPtr_app_update func_update, FPtr_destroy func_destroy, char_t *options)  @nogc nothrow;



version (Windows) {
    public import nappgui.osapp.osmain_win;
}
else version (OSX) {
    public import nappgui.osapp.osmain_osx;
}
else version (linux) {
    public import nappgui.osapp.osmain_gtk;
}
else {
    static assert(0, "Unknown platform");
}

