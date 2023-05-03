/** 
 * Processes
 * 
 * See_Also: https://nappgui.com/en/osbs/bproc.html
 */

module nappgui.osbs.bproc;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Proc *bproc_exec(const char_t *command, perror_t *error);

void bproc_close(Proc **proc);

bool_t bproc_cancel(Proc *proc);

uint32_t bproc_wait(Proc *proc);

bool_t bproc_finish(Proc *proc, uint32_t *code);

bool_t bproc_read(Proc *proc, byte_t *data, uint32_t size, uint32_t *rsize, perror_t *error);

bool_t bproc_eread(Proc *proc, byte_t *data, uint32_t size, uint32_t *rsize, perror_t *error);

bool_t bproc_write(Proc *proc, const byte_t *data, uint32_t size, uint32_t *wsize, perror_t *error);

bool_t bproc_read_close(Proc *proc);

bool_t bproc_eread_close(Proc *proc);

bool_t bproc_write_close(Proc *proc);

void bproc_exit(uint32_t code);
