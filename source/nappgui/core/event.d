 /** 
 * Events
 * 
 * See_Also: https://nappgui.com/en/core/event.html
 */

module nappgui.core.event;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

version (NAppGUI_NoGC_Callbacks) {
    extern(C) nothrow @nogc mixin Callbacks;
}
else { 
    extern(C) nothrow mixin Callbacks; 
}
private mixin template Callbacks() {
    alias EventHandler(T) = void function(T *obj, Event *event);

    extern(C)
    Listener* listener(T)(T* object, void function(T *obj, Event *event) func_event_handler) {
    return listener_imp(object, cast(FPtr_event_handler)func_event_handler);
    }

    extern(C)
    Listener* IListen(string method, T)(T* object) {
        EventHandler!T handler = (o, e) => mixin("o."~method)(e);
        return listener(object, handler);
    }

    extern(C)
    Listener* listen(alias method, T)(T* object) 
    {
        static assert(is(typeof(__traits(child, T.init, method)(cast(Event*)(null)))),
            "`method` must be a member of `T` and take `Event*` as an argument");
        EventHandler!T handler = (o, e) { 
            __traits(child, *o, method)(e); 
        };
        return listener(object, handler);
    }

}

extern(C) @nogc nothrow:

Listener *listener_imp(void *object, FPtr_event_handler func_event_handler);

void listener_destroy(Listener **listener);

void listener_update(Listener **listener, Listener *new_listener);

void listener_event_imp(Listener *listener, uint32_t type, void *sender, 
        void *params, void *result, const char_t *sender_type, 
        const char_t *params_type, const char_t *result_type);

void listener_pass_event_imp(Listener *listener, Event *event, void *sender, 
        const char_t *sender_type);

uint32_t event_type(const Event *event);

void *event_sender_imp(Event *event, const char_t *type);

void *event_params_imp(Event *event, const char_t *type);

void *event_result_imp(Event *event, const char_t *type);

void listener_event(Sender, Params, Result)(Listener* listener, uint32_t type, 
        Sender* sender, Params* params, Result* result) {
    listener_event_imp(listener, type, sender, params, result, 
            Sender.stringof, Params.stringof, Result.stringof);
}

void listener_pass_event(Sender)(Listener* listener, Event* event, Sender* sender) {
    listener_pass_event_imp(listener, event, sender, Sender.stringof);
}

T* event_sender(T)(Event* event) {
    return cast(T*)event_sender_imp(event, T.stringof);
}

T* event_params(T)(Event* event) {
    return cast(T*)event_params_imp(event, T.stringof);
}

T* event_result(T)(Event* event) {
    return cast(T*)event_result_imp(event, T.stringof);
}
