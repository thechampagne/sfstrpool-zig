// Copyright 2023 XXIV
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
pub const STRPOOL_U64 = c_ulonglong;

pub const strpool_t = opaque {};

pub const strpool_config_t = extern struct {
    memctx: ?*anyopaque,
    ignore_case: c_int,
    counter_bits: c_int,
    index_bits: c_int,
    entry_capacity: c_int,
    block_capacity: c_int,
    block_size: c_int,
    min_length: c_int,
};

pub extern "C" const strpool_default_config: strpool_config_t;
pub extern "C" fn strpool_init(pool: ?*strpool_t, config: [*c]const strpool_config_t) void;
pub extern "C" fn strpool_term(pool: ?*strpool_t) void;
pub extern "C" fn strpool_defrag(pool: ?*strpool_t) void;
pub extern "C" fn strpool_inject(pool: ?*strpool_t, string: [*c]const u8, length: c_int) STRPOOL_U64;
pub extern "C" fn strpool_discard(pool: ?*strpool_t, handle: STRPOOL_U64) void;
pub extern "C" fn strpool_incref(pool: ?*strpool_t, handle: STRPOOL_U64) c_int;
pub extern "C" fn strpool_decref(pool: ?*strpool_t, handle: STRPOOL_U64) c_int;
pub extern "C" fn strpool_getref(pool: ?*strpool_t, handle: STRPOOL_U64) c_int;
pub extern "C" fn strpool_isvalid(pool: ?*const strpool_t, handle: STRPOOL_U64) c_int;
pub extern "C" fn strpool_cstr(pool: ?*const strpool_t, handle: STRPOOL_U64) [*c]const u8;
pub extern "C" fn strpool_length(pool: ?*const strpool_t, handle: STRPOOL_U64) c_int;
pub extern "C" fn strpool_collate(pool: ?*const strpool_t, count: [*c]c_int) [*c]u8;
pub extern "C" fn strpool_free_collated(pool: ?*const strpool_t, collated_ptr: [*c]u8) void;
