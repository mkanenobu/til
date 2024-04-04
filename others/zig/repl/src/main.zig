const std = @import("std");
const io = std.io;

const repl = @import("repl.zig").repl;

pub fn main() !void {
    const stdin = io.getStdIn().reader();
    const stdout = io.getStdOut().writer();

    try repl(stdin, stdout);
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
