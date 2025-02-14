const std = @import("std");
const Promise = @import("./promise.zig").Promise;

pub fn main() !void {
    const name = "World";
    var p = try Promise(i32).run(std.heap.page_allocator, hello, .{name});
    p.wait();
}

fn hello(name: []const u8) i32 {
    std.debug.print("Hello, {s}!\n", .{name});
    return 1;
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

comptime {
    std.testing.refAllDecls(@This());
}
