/** Arrays of pointers */
module nappgui.core.arrpt;

import nappgui.config;
import nappgui.core.array;
import nappgui.core.core;
import nappgui.sewer.bstd;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

struct ArrPt(T)
{
	static {
		ArrPt!T* create() {
			return cast(ArrPt!T*)array_create((T*).sizeof, i_arrpttype!T);
		}

		ArrPt!T* copy(const ArrPt!T *array, T* function(const T*) func_copy) {
			return cast(ArrPt!T*)array_copy_ptr(cast(Array*)array, cast(FPtr_copy)func_copy, i_arrpttype!T);
		}

		ArrPt!T* read(Stream *stm, T* function(Stream*) func_read) {
			return cast(ArrPt!T*)array_read_ptr(stm, cast(FPtr_read)func_read, i_arrpttype!T);
		}

		void destroy(ArrPt!T **array, void function(T**) func_destroy) {
		    array_destroy_ptr(cast(Array**)array, cast(FPtr_destroy)func_destroy, i_arrpttype!T);
		}

		void destopt(ArrPt!T **array, void function(T**) func_destroy) {
		    array_destopt_ptr(cast(Array**)array, cast(FPtr_destroy)func_destroy, i_arrpttype!T);
		}

		void clear(ArrPt!T *array, void function(T**) func_destroy) {
		    array_clear_ptr(cast(Array*)array, cast(FPtr_destroy)func_destroy);
		}

		void write(Stream *stm, const ArrPt!T *array, void function(Stream*, const T*) func_write) {
		    array_write_ptr(stm, cast(const Array*)array, cast(FPtr_write)func_write);
		}

		uint32_t size(const ArrPt!T *array) {
			return array_size(cast(Array*)array);
		}
			
		T* get(ArrPt!T *array, uint32_t pos) {
			return *cast(T**)array_get(cast(Array*)array, pos);
		}

		const(T)* get(const ArrPt!T *array, uint32_t pos) {
			return *cast(const T**)array_get(cast(const Array*)array, pos);
		}

		T* first(ArrPt!T *array) {
			return *cast(T**)array_get(cast(Array*)array, 0);
		}

		const(T)* first(const ArrPt!T *array) {
			return *cast(const T**)array_get(cast(const Array*)array, 0);
		}

		T* last(ArrPt!T *array) {
			return *cast(T**)array_get_last(cast(Array*)array);
		}

		const(T)* last(const ArrPt!T *array) {
			return *cast(const T**)array_get_last(cast(const Array*)array);
		}

		T** all(ArrPt!T *array) {
			return cast(T**)array_all(cast(Array*)array);
		}

		const(T)** all(const ArrPt!T *array) {
			return cast(const(T)**)array_all(cast(Array*)array);
		}

		void grow(ArrPt!T *array, uint32_t n) {
			array_insert(cast(Array*)array, UINT32_MAX, n);
		}

		void append(ArrPt!T *array, T *value) {
			*cast(T**)array_insert(cast(Array*)array, UINT32_MAX, 1) = value;
		}

		void prepend(ArrPt!T *array, T *value) {
			*cast(T**)array_insert(cast(Array*)array, 0, 1) = value;
		}

		void insert(ArrPt!T *array, uint32_t pos, T *value) {
			*cast(T**)array_insert(cast(Array*)array, pos, 1) = value;
		}

		void join(ArrPt!T *dest, const ArrPt!T *src, T* function(const T*) func_copy) {
			array_join_ptr(cast(Array*)dest, cast(const Array*)src, cast(FPtr_copy)func_copy);
		}

		void ddelete(ArrPt!T *array, uint32_t pos, void function(T**) func_destroy) {
			array_delete_ptr(cast(Array*)array, pos, 1, cast(FPtr_destroy)func_destroy);
		}

		void pop(ArrPt!T *array, void function(T**) func_destroy) {
			array_pop_ptr(cast(Array*)array, cast(FPtr_destroy)func_destroy);
		}

		void sort(ArrPt!T *array, int function(const T*, const T*) func_compare) {
			array_sort_ptr(cast(Array*)array, cast(FPtr_compare)func_compare);
		}

		uint32_t find(ArrPt!T *array, const T *elem) {
			return array_find_ptr(cast(const Array*)array, cast(const void*)elem);
		}
	}

	static if (!NAppGUI_NoAsserts) {
		// Only for debuggers inspector (non used)
		struct TypeData(T1)
		{
			T1*[1024] elem;
		}

		uint32_t reserved;
	    uint32_t nsize;
	    uint16_t elem_sizeof;
	    TypeData!T *content;
	}

}

private enum i_arrpttype(T) = "ArrPt<"~T.stringof~">";

struct ArrP2(T, D)
{
static:

	void sort_ex(
			ArrPt!T *array, 
			int function(const T*, const T*, const D*) func_compare, 
			const D *data) {
		array_sort_ptr_ex(cast(Array*)array, 
				cast(FPtr_compare_ex)func_compare, cast(void*)data);
	}

	T* search(
			ArrPt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(T*)array_search_ptr(cast(Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}

	const(T)* search(
			const ArrPt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(const T*)array_search_ptr(cast(const Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}

	T* bsearch(
			ArrPt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(T*)array_bsearch_ptr(cast(Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}

	const(T)* bsearch(
			const ArrPt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(const T*)array_bsearch_ptr(cast(const Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}
}


ArrPt!T* arrpt_create(T)() {
	return ArrPt!T.create();
}

ArrPt!T* arrpt_copy(T)(const ArrPt!T *array, T* function(const T*) func_copy) {
	return ArrPt!T.copy(array, func_copy);
}

ArrPt!T* arrpt_read(T)(Stream *stm, T* function(Stream*) func_read) {
	return ArrPt!T.arrpt_read(stm, func_read);
}

void arrpt_destroy(T)(ArrPt!T **array, void function(T**) func_destroy) {
	ArrPt!T.destroy(array, func_destroy);
}

void destopt(T)(ArrPt!T **array, void function(T**) func_destroy) {
	ArrPt!T.destopt(array, func_destroy);
}

void arrpt_clear(T)(ArrPt!T *array, void function(T**) func_destroy) {
	ArrPt!T.clear(array, func_destroy);
}

void arrpt_write(T)(Stream *stm, const ArrPt!T *array, 
		void function(Stream*, const T*) func_write) {
	ArrPt!T.clear(stm, array, func_write);
}

uint32_t arrpt_size(T)(const ArrPt!T *array) {
	return ArrPt!T.size(array);
}

T* arrpt_get(T)(ArrPt!T *array, uint32_t pos) {
	return ArrPt!T.get(array, pos);
}

const(T)* arrpt_get_const(T)(const ArrPt!T *array, uint32_t pos) {
	return ArrPt!T.get(array, pos);
}

T* arrpt_first(T)(ArrPt!T *array) {
	return ArrPt!T.first(array);
}

const(T)* arrpt_first_const(T)(const ArrPt!T *array) {
	return ArrPt!T.first(array);
}

T* arrpt_last(T)(ArrPt!T *array) {
	return ArrPt!T.last(array);
}

const(T)* arrpt_last_const(T)(const ArrPt!T *array) {
	return ArrPt!T.last(array);
}

T** arrpt_all(T)(ArrPt!T *array) {
	return ArrPt!T.all(array);
}

const(T)** arrpt_all_const(T)(const ArrPt!T *array) {
	return ArrPt!T.all(array);
}

void arrpt_grow(T)(ArrPt!T *array, uint32_t n) {
	ArrPt!T.grow(array, n);
}

void arrpt_append(T)(ArrPt!T *array, T *value) {
	ArrPt!T.append(array, value);
}

void arrpt_prepend(T)(ArrPt!T *array, T *value) {
	ArrPt!T.prepend(array, value);
}

void arrpt_insert(T)(ArrPt!T *array, uint32_t pos, T *value) {
	ArrPt!T.insert(array, pos, value);
}

void arrpt_join(T)(ArrPt!T *dest, const ArrPt!T *src, T* function(const T) func_copy) {
	ArrPt!T.join(dest, src, func_copy);
}

void arrpt_delete(T)(ArrPt!T *array, uint32_t pos, void function(T**) func_destroy) {
	ArrPt!T.ddelete(array, pos, func_destroy);
}

void arrpt_pop(T)(ArrPt!T *array, void function(T**) func_destroy) {
	ArrPt!T.pop(array, func_destroy);
}

void arrpt_sort(T)(ArrPt!T *array, int function(const T*, const T*) func_compare) {
	ArrPt!T.sort(array, func_compare);
}

uint32_t arrpt_find(T)(ArrPt!T *array, const T *elem) {
	return ArrPt!T.find(array, elem);
}



void arrpt_sort_ex(T, D)(
		ArrPt!T *array, 
		int function(const T*, const T*, const D*) func_compare, 
		const D *data) {
	ArrP2!(T, D)(array, func_compare, data);
}

T* arrpt_search(T, D)(
		ArrPt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrP2!(T, D)(array, func_compare, key, pos);
}

const(T)* arrpt_search_const(T, D)(
		const ArrPt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrP2!(T, D)(array, func_compare, key, pos);
}

T* arrpt_bsearch(T, D)(
		ArrPt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrP2!(T, D)(array, func_compare, key, pos);
}

const(T)* arrpt_bsearch_const(T, D)(
		const ArrPt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrP2!(T, D)(array, func_compare, key, pos);
}


// Replacement for arrpt_foreach/arrpt_forback
auto arrpt_range(T)(ArrPt!T *array) {
	import std.range, std.algorithm;
	T** elements = arrpt_all(array);
	return iota(arrpt_size(array)).map!(i => elements[i]);
}

// Replacement for arrpt_foreach_const/arrpt_forback_const
auto arrpt_range_const(T)(const ArrPt!T *array) {
	import std.range, std.algorithm;
	const(T*)* elements = arrpt_all_const(array);
	return iota(arrpt_size(array)).map!(i => elements[i]);
}

