const std = @import("std");
const ChildProcess = std.ChildProcess;

pub fn childProcessExec() !void {
    const argv = [_][]const u8{ "echo", "Hello, World!" };

    const result = try ChildProcess.exec(.{
        .allocator = std.heap.page_allocator,
        .argv = &argv,
    });
    std.debug.print("{s}", .{result.stdout});
}
