const std = @import("std");
const expect = std.testing.expect;
const debug = std.debug;

pub fn run() void {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    debug.print("x == {}\n", .{x});

    // ifステートメントは式としても機能する
    var y: u8 = if (a) 1 else 2;
    debug.print("y == {}\n", .{y});
}
