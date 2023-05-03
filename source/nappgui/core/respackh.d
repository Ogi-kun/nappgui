/// Undocumented (hidden) API about resource packages
module nappgui.core.respackh;

import nappgui.config;
import nappgui.core.arrpt;
import nappgui.core.core;
import nappgui.core.coreh;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

ResPack *respack_embedded(const char_t *name);

ResPack *respack_packed(const char_t *name, const char_t *locale);

void respack_add_msg(ResPack *pack, const char_t *msg);

void respack_add_cdata(ResPack *pack, uint32_t T, const byte_t *data, uint32_t data_size);

void *respack_object_imp(const ResPack *pack, const ResId id, 
        FPtr_create_from_data func_create, FPtr_destroy func_destroy);

void *respack_aobj_imp(const ArrPt!ResPack *packs, const ResId id, 
        FPtr_create_from_data func_create, FPtr_destroy func_destroy, bool_t *is_resid);

const(char_t)* respack_atext(const ArrPt!ResPack* packs, const ResId id, bool_t *is_resid);

const(byte_t)* respack_afile(const ArrPt!ResPack* packs, const ResId id, uint32_t *size, bool_t *is_resid);


T* respack_object(T)(
        const ResPack *pack, 
        const ResId id, 
        T* function(const byte_t *data, uint32_t size) func_create, 
        void function(T** item) func_destroy) {
    return cast(T*)respack_object_imp(pack, id, cast(FPtr_create_from_data)func_create, 
            cast(FPtr_destroy)func_destroy);
}

T* respack_aobj(T)(
        const ArrPt!(ResPack*) packs, 
        const ResId id, 
        T* function(const byte_t *data, uint32_t size) func_create, 
        void function(T** item) func_destroy, 
        bool_t * is_resid) {
    return cast(T*)respack_aobj_imp(packs, id, cast(FPtr_create_from_data)func_create, 
            cast(FPtr_destroy)func_destroy, is_resid);
}
