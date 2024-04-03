const std = @import("std");
const unicode = std.unicode;
const io = std.io;
const mem = std.mem;

fn read_stdin_with_allocator(allocator: *mem.Allocator) !std.ArrayList(u8) {
    const stdin = io.getStdIn();
    defer stdin.close();

    const reader = stdin.reader();
    var buf = std.ArrayList(u8).init(allocator.*);
    _ = try reader.readAllArrayList(&buf, 1024 * 1024);
    return buf;
}

fn read_stdin() !void {
    // const stdin = io.getStdIn();
    // defer stdin.close();

    // const reader = io.bufferedReader(stdin.reader());
    // var buf = std.ArrayList(u8).init(std.heap.page_allocator);
    // _ = try reader.reader().readAllArrayList(&buf, 1024 * 1024);
    // std.debug.print("stdin: {s}\n", .{buf});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();

    const in = try read_stdin_with_allocator(&allocator);
    std.debug.print("stdin: {s}\n", .{in.items});

    try read_stdin();

    // const stdout = io.getStdOut();
    // var bw = std.io.bufferedWriter(stdout);
    // try stdout.write(in.items);
    // try bw.flush();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
