// SPDX-License-Identifier: BSD-3-Clause
// Copyright (c) 2022, Alex Taradov <alex@taradov.com>. All rights reserved.

#ifndef _UTILS_H_
#define _UTILS_H_

/*- Includes ----------------------------------------------------------------*/
#include <cstdint>
#include <vector>
#include <string>

using namespace std;

/*- Prototypes --------------------------------------------------------------*/
void sha256(uint8_t *data, int size, uint8_t *hash);
uint32_t crc32(uint8_t *data, int size);
vector<vector<string>> parse_command_file(const char *filename);

#endif // _UTILS_H_

