// SPDX-License-Identifier: BSD-3-Clause
// Copyright (c) 2013-2022, Alex Taradov <alex@taradov.com>. All rights reserved.

#ifndef _EDBG_H_
#define _EDBG_H_

/*- Includes ----------------------------------------------------------------*/
#include <assert.h>
#include <stdarg.h>
#include <cstdint>
#include <cstdbool>

/*- Definitions -------------------------------------------------------------*/
#define ARRAY_SIZE(x) ((int)(sizeof(x) / sizeof(0[x])))

/*- Prototypes --------------------------------------------------------------*/
void verbose(const char *fmt, ...);
void message(const char *fmt, ...);
void warning(const char *fmt, ...);
void check(bool cond, const char *fmt, ...);
void error_exit(const char *fmt, ...);
void sleep_ms(int ms);
void perror_exit(char *text);
int round_up(int value, int multiple);
void *buf_alloc(int size);
void buf_free(void *buf);
int load_file(char *name, uint8_t *data, int size);
void save_file(char *name, uint8_t *data, int size);
uint8_t *mem_find(uint8_t *haystack, int haystack_size, uint8_t *needle, int needle_size);

#endif // _EDBG_H_

