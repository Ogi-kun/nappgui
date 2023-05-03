/** Arrays of structures */
module nappgui.core.arrst;

import nappgui.config;
import nappgui.core.array;
import nappgui.core.core;
import nappgui.sewer.bstd;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

struct ArrSt(T)
{
	
	static {
		ArrSt!T* create() {
			return cast(ArrSt!T*)array_create(T.sizeof, i_arrpttype!T);
		}

		ArrSt!T* copy(const ArrSt!T *array, void function(T*, const T) func_copy) {
		    return cast(ArrSt!T*)array_copy(cast(Array*)array, cast(FPtr_scopy)func_copy, i_arrpttype!T);
		}

		ArrSt!T* read(Stream *stm, void function(Stream*, T*) func_read) {
			return cast(ArrSt!T*)array_read(stm, T.sizeof, cast(FPtr_read_init)func_read, i_arrpttype!T);
		}

		void destroy(ArrSt!T **array, void function(T*) func_remove) {
		    array_destroy(cast(Array**)array, cast(FPtr_remove)func_remove, i_arrpttype!T);
		}

		void destopt(ArrSt!T **array, void function(T*) func_remove) {
		    array_destopt(cast(Array**)array, cast(FPtr_remove)func_remove, i_arrpttype!T);
		}

		void clear(ArrSt!T *array, void function(T*) func_remove) {
			array_clear(cast(Array*)array, cast(FPtr_remove)func_remove);
		}

		void write(Stream *stm, const ArrSt!T *array, void function(Stream*, const T*)func_write) {
			array_write(stm, cast(const Array*)array, cast(FPtr_write)func_write);
		}

		uint32_t size(const ArrSt!T *array) {
			return array_size(cast(Array*)array);
		}
			
		T* get(ArrSt!T *array, uint32_t pos) {
			return cast(T*)array_get(cast(Array*)array, pos);
		}

		const(T)* get(const ArrSt!T *array, uint32_t pos) {
			return cast(const T*)array_get(cast(const Array*)array, pos);
		}

		T* first(ArrSt!T *array) {
			return cast(T*)array_get(cast(Array*)array, 0);
		}

		const(T)* first(const ArrSt!T *array) {
			return cast(const T*)array_get(cast(const Array*)array, 0);
		}

		T* last(ArrSt!T *array) {
			return cast(T*)array_get_last(cast(Array*)array);
		}

		const(T)* last(const ArrSt!T *array) {
			return cast(const T*)array_get_last(cast(const Array*)array);
		}

		T* all(ArrSt!T *array) {
			return cast(T*)array_all(cast(Array*)array);
		}

		const(T)* all(const ArrSt!T *array) {
			return cast(T*)array_all(cast(Array*)array);
		}

		void grow(ArrSt!T *array, uint32_t n) {
			array_insert(cast(Array*)array, uint32_t.max, n);
		}

		T* nnew(ArrSt!T *array) {
			return cast(T*)array_insert(cast(Array*)array, uint32_t.max, 1);
		}

		T* new0(ArrSt!T *array) {
			return cast(T*)array_insert0(cast(Array*)array, uint32_t.max, 1);
		}

		T* new_n(ArrSt!T *array, uint32_t n) {
			return cast(T*)array_insert(cast(Array*)array, uint32_t.max, n);
		}

		T* new_n0(ArrSt!T *array, uint32_t n) {
			return cast(T*)array_insert0(cast(Array*)array, uint32_t.max, n);
		}

		T* prepend_n(ArrSt!T *array, uint32_t n) {
			return cast(T*)array_insert(cast(Array*)array, 0, n);
		}

		T* insert_n(ArrSt!T *array, uint32_t pos, uint32_t n) {
			return cast(T*)array_insert(cast(Array*)array, pos, n);
		}

		void append(ArrSt!T *array, T value) {
			*cast(T*)array_insert(cast(Array*)array, uint32_t.max, 1) = value;
		}

		void prepend(ArrSt!T *array, T value) {
			*cast(T*)array_insert(cast(Array*)array, 0, 1) = value;
		}

		void insert(ArrSt!T *array, uint32_t pos, T value) {
			*cast(T*)array_insert(cast(Array*)array, pos, 1) = value;
		}

		void join(ArrSt!T *dest, const ArrSt!T *src, void function(T*, const T) func_copy) {
			array_join(cast(Array*)dest, cast(const Array*)src, cast(FPtr_scopy)func_copy);
		}

		void ddelete(ArrSt!T *array, uint32_t pos, void function(T*) func_remove) {
			array_delete(cast(Array*)array, pos, 1, cast(FPtr_remove)func_remove);
		}

		void pop(ArrSt!T *array, void function(T*) func_remove) {
			array_pop(cast(Array*)array, cast(FPtr_remove)func_remove);
		}

		void sort(ArrSt!T *array, int function(const T*, const T*) func_compare) {
			array_sort(cast(Array*)array, cast(FPtr_compare)func_compare);
		}

	}

	static if (!NAppGUI_NoAsserts) {
		// Only for debuggers inspector (non used)
		struct TypeData(T1)
		{
			T1[1024] elem;
		}

		uint32_t reserved;
	    uint32_t nsize;
	    uint16_t elem_sizeof;
	    TypeData!T *content;
	}
}

private enum i_arrpttype(T) = "ArrSt<"~T.stringof~">";

struct ArrS2(T, D)
{
static:
	void sort_ex(
			ArrSt!T *array, 
			int function(const T*, const T*, const D*) func_compare, 
			const D *data) {
		array_sort_ex(cast(Array*)array, cast(FPtr_compare_ex)func_compare, cast(void*)data);
	}

	T* search(
			ArrSt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(T*)array_search(cast(Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}

	const(T)* search(
			const ArrSt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(const T*)array_search(cast(const Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}

	T* bsearch(
			ArrSt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(T*)array_bsearch(cast(Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}

	const(T)* bsearch(
			const ArrSt!T *array, 
			int function(const T*, const T*) func_compare, 
			const D *key, 
			uint32_t *pos) {
		return cast(const T*)array_bsearch(cast(const Array*)array, 
				cast(FPtr_compare)func_compare, cast(const void*)key, pos);
	}
}


ArrSt!T* arrst_create(T)() {
	return ArrSt!T.create();
}

ArrSt!T* arrst_copy(T)(const ArrSt!T *array, T* function(const T*) func_copy) {
	return ArrSt!T.copy(array, func_copy);
}

ArrSt!T* arrst_read(T)(Stream *stm, T* function(Stream*) func_read) {
	return ArrSt!T.arrst_read(stm, func_read);
}

void arrst_destroy(T)(ArrSt!T **array, void function(T**) func_destroy) {
	ArrSt!T.destroy(array, func_destroy);
}

void destopt(T)(ArrSt!T **array, void function(T**) func_destroy) {
	ArrSt!T.destopt(array, func_destroy);
}

void arrst_clear(T)(ArrSt!T *array, void function(T**) func_destroy) {
	ArrSt!T.clear(array, func_destroy);
}

void arrst_write(T)(Stream *stm, const ArrSt!T *array, 
		void function(Stream*, const T*) func_write) {
	ArrSt!T.clear(stm, array, func_write);
}

uint32_t arrst_size(T)(const ArrSt!T *array) {
	return ArrSt!T.size(array);
}

T* arrst_get(T)(ArrSt!T *array, uint32_t pos) {
	return ArrSt!T.get(array, pos);
}

const(T)* arrst_get_const(T)(const ArrSt!T *array, uint32_t pos) {
	return ArrSt!T.get(array, pos);
}

T* arrst_first(T)(ArrSt!T *array) {
	return ArrSt!T.first(array);
}

const(T)* arrst_first_const(T)(const ArrSt!T *array) {
	return ArrSt!T.first(array);
}

T* arrst_last(T)(ArrSt!T *array) {
	return ArrSt!T.last(array);
}

const(T)* arrst_last_const(T)(const ArrSt!T *array) {
	return ArrSt!T.last(array);
}

T** arrst_all(T)(ArrSt!T *array) {
	return ArrSt!T.all(array);
}

const(T)** arrst_all_const(T)(const ArrSt!T *array) {
	return ArrSt!T.all(array);
}

void arrst_grow(T)(ArrSt!T *array, uint32_t n) {
	ArrSt!T.grow(array, n);
}

T* arrst_new(T)(ArrSt!T *array) {
	return ArrSt!T.nnew(array);
}

T* arrst_new0(T)(ArrSt!T *array) {
	return ArrSt!T.new0(array);
}

T* arrst_new_n(T)(ArrSt!T *array, uint32_t n) {
	return ArrSt!T.new_n(array, n);
}

T* arrst_new_n0(T)(ArrSt!T *array, uint32_t n) {
	return ArrSt!T.new_n0(array, n);
}

T* arrst_prepend_n(T)(ArrSt!T *array, uint32_t n) {
	return ArrSt!T.prepend_n(array, n);
}

T* arrst_insert_n(T)(ArrSt!T *array, uint32_t pos, uint32_t n) {
	return ArrSt!T.insert_n(array, pos, n);
}

void arrst_append(T)(ArrSt!T *array, T *value) {
	ArrSt!T.append(array, value);
}

void arrst_prepend(T)(ArrSt!T *array, T *value) {
	ArrSt!T.prepend(array, value);
}

void arrst_insert(T)(ArrSt!T *array, uint32_t pos, T *value) {
	ArrSt!T.insert(array, pos, value);
}

void arrst_join(T)(ArrSt!T *dest, const ArrSt!T *src, T* function(const T) func_copy) {
	ArrSt!T.join(dest, src, func_copy);
}

void arrst_delete(T)(ArrSt!T *array, uint32_t pos, void function(T**) func_destroy) {
	ArrSt!T.ddelete(array, pos, func_destroy);
}

void arrst_pop(T)(ArrSt!T *array, void function(T**) func_destroy) {
	ArrSt!T.pop(array, func_destroy);
}

void arrst_sort(T)(ArrSt!T *array, int function(const T*, const T*) func_compare) {
	ArrSt!T.sort(array, func_compare);
}

uint32_t arrst_find(T)(ArrSt!T *array, const T *elem) {
	return ArrSt!T.find(array, elem);
}




void arrst_sort_ex(T, D)(
		ArrSt!T *array, 
		int function(const T*, const T*, const D*) func_compare, 
		const D *data) {
	ArrS2!(T, D).sort_ex(array, func_compare, data);
}

T* arrst_search(T, D)(
		ArrSt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrS2!(T, D).sort_ex(array, func_compare, key, pos);
}

const(T)* arrst_search_const(T, D)(
		const ArrSt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrS2!(T, D).sort_ex(array, func_compare, key, pos);
}

T* arrst_bsearch(T, D)(
		ArrSt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrS2!(T, D).arrst_bsearch(array, func_compare, key, pos);
}

const(T)* arrst_bsearch_const(T, D)(
		const ArrSt!T *array, 
		int function(const T*, const T*) func_compare, 
		const D *key, 
		uint32_t *pos) {
	return ArrS2!(T, D).arrst_bsearch(array, func_compare, key, pos);
}
