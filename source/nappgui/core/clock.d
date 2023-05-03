/** 
 * Clock (Frame counter)
 * 
 * See_Also: https://nappgui.com/en/core/clock.html
 */
module nappgui.core.clock;

import nappgui.config;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Clock *clock_create(real64_t interval);

void clock_destroy(Clock **clk);

bool_t clock_frame(Clock *clk, real64_t *prev_frame, real64_t *curr_frame);

void clock_reset(Clock *clk);

real64_t clock_elapsed(const Clock *clk);
