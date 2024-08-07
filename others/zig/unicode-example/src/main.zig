const std = @import("std");
const unicode = std.unicode;
const ArrayList = std.ArrayList;

// ref: https://zig.news/dude_the_builder/unicode-basics-in-zig-dj3
pub fn main() !void {
    // 文字列リテラルの中にASCII文字ではないものを含む場合でも型は同じ（コードポイントでバラされる）
    const unicodeStr = "Hello, 世界😼";
    std.debug.print("\"{s}\", typeof string: \"{}\", length of string: {}\n", .{ unicodeStr, @TypeOf(unicodeStr), unicodeStr.len });

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const status = gpa.deinit();
        if (status == .leak) @panic("Memory leak detected.");
    }

    const allocator = gpa.allocator();
    var buf = ArrayList([]const u8).init(allocator);
    defer buf.deinit();
    try splitByRune(unicodeStr, &buf);
    for (buf.items) |rune| {
        std.debug.print("{s}\n", .{rune});
    }
}

fn splitByRune(str: []const u8, buffer: *ArrayList([]const u8)) !void {
    var utf8view = try unicode.Utf8View.init(str);
    var code_point_iterator = utf8view.iterator();
    while (code_point_iterator.nextCodepointSlice()) |rune| {
        try buffer.append(rune);
    }
}

test "splitByRule" {
    const expect = std.testing.expect;
    const allocator = std.testing.allocator;

    var buf = ArrayList([]const u8).init(allocator);
    defer buf.deinit();

    try splitByRune("Hello, 世界😼", &buf);
    try expect(buf.items.len == 10);
    try expect(std.mem.eql(u8, buf.getLast(), "😼"));
}
