const std = @import("std");

pub fn main() !void {
    var m = std.StringHashMap([]const u8).init(std.heap.page_allocator);
    const str = "abc";
    try m.put(str[0..], "f");

    var iter = m.iterator();
    while (iter.next()) |entry| {
        const key = entry.key_ptr.*;
        const value = entry.value_ptr.*;
        std.debug.print("{s}: {s}\n", .{ key, value });
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
