const std = @import("std");
const debugPrint = std.debug.print;
const expect = std.testing.expect;

// 前提としてzigに文字列型は無く、バイト列を使う
// 文字列リテラルは↓のどちらかになる
const String = []const u8;
const PointerString = [*:0]const u8;

pub fn main() !void {
    const s = "Hello, World!";
    // 比較
    try expect(std.mem.eql(u8, s, "Hello, World!"));
    try expect(!std.mem.eql(u8, s, "Foo"));

    var buf: [128]u8 = undefined;
    // sprintf的なやつ、bufferに値をセットするが返り値としても返す
    var res = try std.fmt.bufPrint(&buf, "{s}, {}, {any}", .{ "Hello", 123, .{ .x = 1, .y = 2 } });
    debugPrint("{s}\n", .{buf});
    debugPrint("{s}\n", .{res});
}
