const std = @import("std");
const os = std.os;
const process = std.process;

pub fn processExecv() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();

    const command = [_][]const u8{"ls"};
    process.execv(allocator, &command) catch {
        std.debug.print("execv error\n", .{});
    };
}
