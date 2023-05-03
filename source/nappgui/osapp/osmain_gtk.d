/* Cross-platform main */
module nappgui.osapp.osmain_gtk;

version (linux):

import nappgui.osapp.osmain;
import nappgui.sewer.types;

mixin template osmain(
        alias func_create, 
        alias func_destroy, 
        string options) 
if (is(typeof(&func_create) : T* function(), T) && 
        is(typeof(&func_destroy) : void function(T**)))
{
    void main() {
        import core.runtime;
        osmain_helper(
                Runtime.cArgs.argc, Runtime.cArgs.argv, null,
                &func_create, &func_destroy, options.ptr);
    }
}

mixin template osmain_sync(
        real64_t lframe, 
        alias func_create, 
        alias func_destroy, 
        alias func_update, 
        string options)
if (is(typeof(&func_create) : T* function(), T)
        && is(typeof(&func_destroy) : void function(T**))
        && is(typeof(&func_update) : void function(T*, real64_t, real64_t)))
{
    void main() {
        import core.runtime;
        osmain_helper(
                Runtime.cArgs.argc, Runtime.cArgs.argv, null,
                &func_create, &func_destroy, options.ptr,
                lframe, &func_update);
    }
}
