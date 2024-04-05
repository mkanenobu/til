const std = @import("std");
const allocators = @import("allocators.zig");
const arrayList = @import("array-list.zig");

pub fn main() !void {
    allocators.run();
    arrayList.run() catch unreachable;
}
