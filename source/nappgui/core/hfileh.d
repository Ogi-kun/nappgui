/* Undocumented (hidden) API about files and directories */
module nappgui.core.hfileh;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

String *hfile_exename();

String *hfile_build_dir(const char_t *dir, const char_t *target);

String *hfile_src_dir(const char_t *file);

String *hfile_root_dir(const char_t *file);

