const std = @import("std");
const io = std.io;

pub fn main() !void {
    try buf_writer();
    try buf_reader();
}

fn buf_writer() !void {
    var buf: [1024]u8 = undefined;
    var fbs = io.fixedBufferStream(&buf);
    var writer = fbs.writer();

    try writer.writeAll("Hello, World!");
    std.debug.print("written: {s}\n", .{fbs.getWritten()});
    fbs.reset();
    std.debug.print("written (reset): {any}\n", .{fbs.getWritten()});
}

fn buf_reader() !void {
    var buf = [_]u8{ 0, 1, 2, 3, 4 };
    var fbs = io.fixedBufferStream(&buf);
    const reader = fbs.reader();

    const read = try reader.readAllAlloc(std.heap.page_allocator, 256);
    std.debug.print("read: {any}\n", .{read});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test {
    std.testing.refAllDecls(@This());
}
