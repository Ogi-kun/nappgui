/** 
 * HTTP request
 * 
 * See_Also: https://nappgui.com/en/inet/httpreq.html
 */
module nappgui.inet.httpreq;

import nappgui.inet.inet;
import nappgui.core.core;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Http *http_create(const char_t *host, uint16_t port);

Http *http_secure(const char_t *host, uint16_t port);

void http_destroy(Http **http);

void http_clear_headers(Http *http);

void http_add_header(Http *http, const char_t *name, const char_t *value);

bool_t http_get(Http *http, const char_t *path, const byte_t *data, uint32_t size, ierror_t *error);

bool_t http_post(Http *http, const char_t *path, const byte_t *data, uint32_t size, ierror_t *error);

uint32_t http_response_status(const Http *http);

const (char_t) *http_response_protocol(const Http *http);

const (char_t) *http_response_message(const Http *http);

uint32_t http_response_size(const Http *http);

const (char_t) *http_response_name(const Http *http, uint32_t index);

const (char_t) *http_response_value(const Http *http, uint32_t index);

const (char_t) *http_response_header(const Http *http, const char_t *name);

bool_t http_response_body(const Http *http, Stream *body, ierror_t *error);

Stream *http_dget(const char_t *url, uint32_t *result, ierror_t *error);

bool_t http_exists(const char_t *url);
