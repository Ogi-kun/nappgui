/** 
 * Sockets base API
 * 
 * See_Also: https://nappgui.com/en/osbs/bsocket.html
 */

module nappgui.osbs.bsocket;

import nappgui.osbs.osbs;
import nappgui.sewer.types;

extern(C) @nogc nothrow:

Socket *bsocket_connect(uint32_t ip, uint16_t port, uint32_t timeout_ms, serror_t *error);

Socket *bsocket_server(uint16_t port, uint32_t max_connect, serror_t *error);

Socket *bsocket_accept(Socket *socket, uint32_t timeout_ms, serror_t *error);

void bsocket_close(Socket **socket);

void bsocket_local_ip(Socket *socket, uint32_t *ip, uint16_t *port);

void bsocket_remote_ip(Socket *socket, uint32_t *ip, uint16_t *port);

void bsocket_read_timeout(Socket *socket, uint32_t timeout_ms);

void bsocket_write_timeout(Socket *socket, uint32_t timeout_ms);

bool_t bsocket_read(Socket *socket, byte_t *data, uint32_t size, uint32_t *rsize, serror_t *error);

bool_t bsocket_write(Socket *socket, const byte_t *data, uint32_t size, uint32_t *wsize, serror_t *error);


uint32_t bsocket_url_ip(const char_t *url, serror_t *error);

uint32_t bsocket_str_ip(const char_t *ip);

const(char_t)* bsocket_host_name(char_t *buffer, uint32_t size);

const(char_t)* bsocket_host_name_ip(uint32_t ip, char_t *buffer, uint32_t size);

const(char_t)* bsocket_ip_str(uint32_t ip);

void bsocket_hton2(byte_t *dest, const byte_t *src);

void bsocket_hton4(byte_t *dest, const byte_t *src);

void bsocket_hton8(byte_t *dest, const byte_t *src);

void bsocket_ntoh2(byte_t *dest, const byte_t *src);

void bsocket_ntoh4(byte_t *dest, const byte_t *src);

void bsocket_ntoh8(byte_t *dest, const byte_t *src);
