const std = @import("std");
const debug = std.debug;

const constant: i32 = 5;
var variable: u32 = 5000;

// @as は値の型を強制する
const inferred_const = @as(i32, 5);
var inferred_var = @as(u32, 5000);

const a: i32 = undefined;
var b: u32 = undefined;

pub fn main() void {
    debug.print("a: {}\n", .{a});
    debug.print("b: {}\n", .{b});
}
