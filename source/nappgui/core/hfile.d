 /** 
 * High-level operations in files and directories
 * 
 * See_Also: https://nappgui.com/en/core/hfile.html
 */

module nappgui.core.hfile;

import nappgui.config;
import nappgui.core.arrst;
import nappgui.core.core;
import nappgui.osbs.osbs;
import nappgui.sewer.sewer;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

bool_t hfile_dir(const char_t *pathname);

bool_t hfile_dir_create(const char_t *pathname, ferror_t *error);

bool_t hfile_dir_destroy(const char_t *pathname, ferror_t *error);

ArrSt!DirEntry* hfile_dir_list(const char_t *pathname, bool_t subdirs, ferror_t *error);

void hfile_dir_entry_remove(DirEntry *entry);

Date hfile_date(const char_t *pathname, bool_t recursive);

bool_t hfile_dir_sync(const char_t *src, const char_t *dest, bool_t recursive, 
        bool_t remove_in_dest, const char_t **except, uint32_t except_size, ferror_t *error);

bool_t hfile_exists(const char_t *pathname, file_type_t *file_type);

bool_t hfile_is_uptodate(const char_t *src, const char_t *dest);

bool_t hfile_copy(const char_t *from, const char_t *to, ferror_t *error);

Buffer *hfile_buffer(const char_t *pathname, ferror_t *error);

String *hfile_string(const char_t *pathname, ferror_t *error);

Stream *hfile_stream(const char_t *pathname, ferror_t *error);

bool_t hfile_from_string(const char_t *pathname, const String *str, ferror_t *error);

bool_t hfile_from_data(const char_t *pathname, const byte_t *data, uint32_t size, ferror_t *error);

bool_t hfile_dir_loop(const char_t *pathname, Listener *listener, bool_t subdirs, bool_t hiddens, ferror_t *error);

String *hfile_appdata(const char_t *filename);

String *hfile_home_dir(const char_t *path);
