const std = @import("std");
const debug = std.debug;

// 5の長さを持つu8のarray
const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
// _で長さの明示的な指定を省略出来る
const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

pub fn run() void {
    // arrayをprintするためには{any}指定子を使う必要がある
    debug.print("a: {any}\n", .{a});
    debug.print("b: {any}\n", .{b});
    debug.print("b length: {}\n", .{b.len});
}
