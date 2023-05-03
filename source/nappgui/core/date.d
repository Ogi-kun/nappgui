/** 
 * Dates
 * 
 * See_Also: https://nappgui.com/en/core/date.html
 */
module nappgui.core.date;

import nappgui.config;
import nappgui.core.core;
import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Date date_system();

Date date_add_seconds(const Date *date, int32_t seconds);

Date date_add_minutes(const Date *date, int32_t minutes);

Date date_add_hours(const Date *date, int32_t hours);

Date date_add_days(const Date *date, int32_t days);

int16_t date_year();

int date_cmp(const Date *date1, const Date *date2);

bool_t date_between(const Date *date, const Date *from, const Date *to);

bool_t date_is_null(const Date *date);

String *date_DD_MM_YYYY_HH_MM_SS(const Date *date);

String *date_YYYY_MM_DD_HH_MM_SS(const Date *date);

const(char_t)* date_month_en(month_t month);

const(char_t)* date_month_es(month_t month);

extern export __gshared Date kDATE_NULL;

