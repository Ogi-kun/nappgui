/** 
 * Set of structures 
 * 
 * See_Also: https://nappgui.com/en/core/setst.html
 */
module nappgui.core.setst;

import nappgui.config;
import nappgui.sewer.bstd;

extern(C) @nogc nothrow:

struct SetSt(T)
{
	static {
		SetSt!T* create(int function(const T*, const T*) func_compare) {
			return cast(SetSt!T*)rbtree_create(cast(FPtr_compare)func_compare, 
			 		cast(uint16_t)T.sizeof, 0, i_settype!T);
		}

		void destroy(SetSt!T **set, void function(T*) func_remove) {
			rbtree_destroy(cast(RBTree**)set, cast(FPtr_remove)func_remove, 
					null, i_settype!T);
		}

		uint32_t size(const SetSt!T *set) {
			return rbtree_size(cast(const RBTree*)set);
		}
			
		T* get(SetSt!T *set, const T *key) {
			return cast(T*)rbtree_get(cast(RBTree*)set, cast(const void*)key, false);
		}

		const(T)* get(const SetSt!T *set, const T *key) {
			return cast(const T*)rbtree_get(cast(RBTree*)set, cast(const void*)key, false);
		}

		bool_t ddelete(SetSt!T *set, const T *key, void function(T*) func_remove) {
			return rbtree_delete(cast(RBTree*)set, cast(const void*)key, 
					cast(FPtr_remove)func_remove, null);
		}

		T* first(SetSt!T *set) {
			return cast(T*)rbtree_first(cast(RBTree*)set);
		}

		T* last(SetSt!T *set) {
			return cast(T*)rbtree_last(cast(RBTree*)set);
		}

		T* next(SetSt!T *set) {
			return cast(T*)rbtree_next(cast(RBTree*)set);
		}

		T* prev(SetSt!T *set) {
			return cast(T*)rbtree_prev(cast(RBTree*)set);
		}

	}

	static if (!NAppGUI_NoAsserts) {
		// Only for debuggers inspector (non used)
		struct TypeNode(T1)
		{
			uint32_t rb;
			TypeNode!T1 *left;
			TypeNode!T1 *right;
			ttype data;
		}

		uint32_t elems;
	    uint16_t esize;
	    uint16_t ksize;
	    TypeNode!T *root;
	    FPtr_compare func_compare;
	}
}

enum i_settype(T) = "SetSt<"~T.stringof~">";

SetSt!T* setst_create(T)(int function(const T*, const T*) func_compare) {
	return SetSt!T.create(func_compare);
}

void setst_destroy(T)(SetSt!T **set, void function(T*) func_remove) {
	SetSt!T.destroy(set, func_remove);
}

uint32_t setst_size(T)(const SetSt!T *set) {
	return SetSt!T.size(set);
}

T* setst_get(T)(SetSt!T *set, const T *key) {
	return SetSt!T.get(set, key);
}

const(T)* setst_get_const(T)(const SetSt!T *set, const T *key) {
	return SetSt!T.get(set, key);
}


/+
#define setst_insert(set, key, type)\
    setst_##type##_insert(set, key)
+/

bool_t setst_delete(T)(SetSt!T *set, const T *key, void function(T*) func_remove) {
	return SetSt!T.ddelete(set, key, func_remove);
}

T* setst_first(T)(SetSt!T *set) {
	return SetSt!T.first(set);
}

T* setst_last(T)(SetSt!T *set) {
	return SetSt!T.last(set);
}

T* setst_next(T)(SetSt!T *set) {
	return SetSt!T.next(set);
}

T* setst_prev(T)(SetSt!T *set) {
	return SetSt!T.prev(set);
}
