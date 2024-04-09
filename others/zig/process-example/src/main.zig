const std = @import("std");
const childprocess = @import("./child-process.zig");
const process = @import("./process.zig");

pub fn main() !void {
    childprocess.childProcessExec() catch unreachable;
    process.processExecv() catch unreachable;
    // std.debug.print("hogehoge\n", .{});
}
