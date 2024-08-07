const std = @import("std");
const process = std.process;

pub fn childProcessExec() !void {
    const argv = [_][]const u8{ "echo", "Hello, World!" };

    const result = try process.Child.run(.{ .argv = &argv, .allocator = std.heap.page_allocator });
    std.debug.print("{s}", .{result.stdout});
}
