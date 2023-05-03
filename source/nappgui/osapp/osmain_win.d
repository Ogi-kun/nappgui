/* Cross-platform main */
module nappgui.osapp.osmain_win;

version (Windows):

import nappgui.osapp.osmain;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

version (X86) {
    enum MANIFEST_PROCESSORARCHITECTURE = "x86";
}
else version (X86_64) {
    enum MANIFEST_PROCESSORARCHITECTURE = "amd64";
}
else version (IA64) {
    enum MANIFEST_PROCESSORARCHITECTURE = "ia64";
}
else {
    enum MANIFEST_PROCESSORARCHITECTURE = "*";
}

/* Enabling Visual Styles for WindowsXP and later */
pragma(linkerDirective, 
        `"/manifestdependency:type='Win32' `~
        `name='Microsoft.Windows.Common-Controls' `~
        `version='6.0.0.0' `~
        `processorArchitecture='`~ MANIFEST_PROCESSORARCHITECTURE ~`' `~
        `publicKeyToken='6595b64144ccf1df' `~
        `language='*'"`);

/*
 * WinMain causes issues with standard i/o
 * https://issues.dlang.org/show_bug.cgi?id=23312
*/

mixin template osmain(
        alias func_create, 
        alias func_destroy, 
        string options) 
{
    extern(C) {
        static if (is(typeof(&func_create) : T* function(), T)) {
            alias App = T;
            static assert(is(typeof(&func_create) : AppCreateFun!App));
            static assert(is(typeof(&func_destroy) : AppDestroyFun!App));
        }
        else {
            static assert(is(typeof(&func_create) : T* function(), T));
        }
    }

    int main() {
        import core.runtime;
        import core.sys.windows.windows;
        osmain_helper(
                Runtime.cArgs.argc, Runtime.cArgs.argv, GetModuleHandle(null),
                &func_create, &func_destroy, options.ptr);
        return 0;
    }
}

mixin template osmain_sync(
        real64_t lframe, 
        alias func_create, 
        alias func_destroy, 
        alias func_update, 
        string options)
{
    extern(C) {
        static if (is(typeof(&func_create) : T* function(), T)) {
            alias App = T;
            static assert(is(typeof(&func_create) : AppCreateFun!App));
            static assert(is(typeof(&func_destroy) : AppDestroyFun!App));
            static assert(is(typeof(&func_update) : AppUpdateFun!App));
        }
        else {
            static assert(is(typeof(&func_create) : T* function(), T));
        }
    }

    int main() {
        import core.runtime;
        import core.sys.windows.windows;
        osmain_helper(
                Runtime.cArgs.argc, Runtime.cArgs.argv, GetModuleHandle(null),
                &func_create, &func_destroy, options.ptr,
                lframe, &func_update);
    
        return 0;
    }
}
