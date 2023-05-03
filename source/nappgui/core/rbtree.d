/** Red - Black trees  */
module nappgui.core.rbtree;

import nappgui.sewer.sewer;
import nappgui.sewer.types;
import nappgui.core.core;

extern(C) @nogc nothrow:

RBTree* rbtree_create(FPtr_compare func_compare, uint16_t esize, uint16_t ksize, const char_t* type);

void rbtree_destroy(RBTree** tree, FPtr_remove func_remove, FPtr_destroy func_destroy_key, const char_t* type);

void rbtree_destroy_ptr(RBTree** tree, FPtr_destroy func_destroy, FPtr_destroy func_destroy_key, const char_t* type);

uint32_t rbtree_size(const RBTree* tree);

byte_t* rbtree_get(const RBTree* tree, const void* key, bool_t isptr);

byte_t* rbtree_insert(RBTree* tree, const void* key, FPtr_copy func_key_copy);

bool_t rbtree_insert_ptr(RBTree* tree, void* ptr);

bool_t rbtree_delete(RBTree* tree, const void* key, FPtr_remove func_remove, FPtr_destroy func_destroy_key);

bool_t rbtree_delete_ptr(RBTree* tree, const void* key, FPtr_destroy func_destroy, FPtr_destroy func_destroy_key);

byte_t* rbtree_first(RBTree* tree);

byte_t* rbtree_last(RBTree* tree);

byte_t* rbtree_next(RBTree* tree);

byte_t* rbtree_prev(RBTree* tree);

byte_t* rbtree_first_ptr(RBTree* tree);

byte_t* rbtree_last_ptr(RBTree* tree);

byte_t* rbtree_next_ptr(RBTree* tree);

byte_t* rbtree_prev_ptr(RBTree* tree);

const(char_t)* rbtree_get_key(const RBTree* tree);

bool_t rbtree_check(const RBTree* tree);

