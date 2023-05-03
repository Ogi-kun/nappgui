/** 
 * Set of pointers 
 * 
 * See_Also: https://nappgui.com/en/core/setpt.html
 */
module nappgui.core.setpt;

import nappgui.config;
import nappgui.sewer.bstd;

extern(C) @nogc nothrow:

struct SetPt(T)
{
	static {
		SetPt!T* create(int function(const T*, const T*) func_compare) {
			return cast(SetPt!T*)rbtree_create(cast(FPtr_compare)func_compare, 
			  		cast(uint16_t)(T*).sizeof, 0, i_setpttype!T);
		}

		void destroy(SetPt!T **set, void function(T**) func_destroy) {
			rbtree_destroy_ptr(cast(RBTree**)set, cast(FPtr_destroy)func_destroy, 
					null, i_setpttype!T);
		}

		uint32_t size(const SetPt!T *set) {
			return rbtree_size(cast(const RBTree*)set);
		}
			
		T* get(SetPt!T *set, const T *key) {
			return cast(T*)rbtree_get(cast(RBTree*)set, cast(const void*)key, null);
		}

		const(T)* get(const SetPt!T *set, const T *key) {
			return cast(const T*)rbtree_get(cast(RBTree*)set, cast(const void*)key, false);
		}

		bool_t ddelete(SetPt!T *set, const T *key, void function(T**) func_destroy) {
			return rbtree_delete_ptr(cast(RBTree*)set, cast(const void*)key, 
					cast(FPtr_destroy)func_destroy, null);
		}

		T* first(SetPt!T *set) {
			return cast(T*)rbtree_first_ptr(cast(RBTree*)set);
		}


		T* last(SetPt!T *set) {
			return cast(T*)rbtree_last_ptr(cast(RBTree*)set);
		}
		

		T* next(SetPt!T *set) {
			return cast(T*)rbtree_next_ptr(cast(RBTree*)set);
		}

		
		T* prev(SetPt!T *set) {
			return cast(T*)rbtree_prev_ptr(cast(RBTree*)set);
		}

		/* 
		* “Const” `first`, `last`, `next` and `prev` are removed
		*/
	}

	static if (!NAppGUI_NoAsserts) {
		// Only for debuggers inspector (non used)
		struct TypeNode(T1)
		{
			uint32_t rb;
			TypeNode!T1 *left;
			TypeNode!T1 *right;
			ttype *data;
		}

		uint32_t elems;
	    uint16_t esize;
	    uint16_t ksize;
	    TypeNode!T *root;
	    FPtr_compare func_compare;
	}
}

enum i_setpttype(T) = "SetPt<"~T.stringof~">";

SetPt!T* setpt_create(T)(int function(const T*, const T*) func_compare) {
	return SetPt!T.create(func_compare);
}

void setpt_destroy(T)(SetPt!T **set, void function(T**) func_destroy) {
	SetPt!T.destroy(set, func_destroy);
}

uint32_t setpt_size(T)(const SetPt!T *set) {
	return SetPt!T.size(set);
}

T* setpt_get(T)(SetPt!T *set, const T *key) {
	return SetPt!T.get(set, key);
}

const(T)* setpt_get_const(T)(const SetPt!T *set, const T *key) {
	return SetPt!T.get(set, key);
}

/+
#define setpt_insert(set, value, type)\
    setpt_##type##_insert(set, value)
+/

bool_t setpt_delete(T)(SetPt!T *set, const T *key, void function(T**) func_destroy) {
	return SetPt!T.ddelete(set, key, func_destroy);
}

T* setpt_first(T)(SetPt!T *set) {
	return SetPt!T.first(set);
}

T* setpt_last(T)(SetPt!T *set) {
	return SetPt!T.last(set);
}

T* setpt_next(T)(SetPt!T *set) {
	return SetPt!T.next(set);
}

T* setpt_prev(T)(SetPt!T *set) {
	return SetPt!T.prev(set);
}

// Replacement for arrpt_foreach
auto arrpt_range(T)(SetPt!T *set) {
	struct Range {
		private SetPt!T* set;
		private T* _front;

		T* front() { return _front; } 
		bool empty() const { return _front is null; }
		void popFront() { _front = setpt_next(set); }
	}

	return Range(set, setpt_first(set));
}


// Replacement for arrpt_forback
auto arrpt_range_retro(T)(SetPt!T *set) {
	struct Range {
		private SetPt!T* set;
		private T* _front;

		T* front() { return _front; } 
		bool empty() const { return _front is null; }
		void popFront() { _front = setpt_prev(set); }
	}

	return Range(set, setpt_last(set));
}
