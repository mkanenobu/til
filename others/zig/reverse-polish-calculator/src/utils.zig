const std = @import("std");
const io = std.io;

var mutex = std.Thread.Mutex{};

pub fn print(comptime format: []const u8, args: anytype) void {
    mutex.lock();
    defer mutex.unlock();
    io.getStdOut().writer().print(format, args) catch return;
}

pub fn printErr(comptime format: []const u8, args: anytype) void {
    std.debug.print(format, args);
}
