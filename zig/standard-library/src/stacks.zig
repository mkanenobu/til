const std = @import("std");
const expect = std.testing.expect;

pub fn run() void {
    stackExample() catch unreachable;
}

fn stackExample() !void {
    // std.ArrayList にはスタックとして利用するためのメソッドが用意されている

    var stack = std.ArrayList(usize).init(std.heap.page_allocator);
    defer stack.deinit();

    try stack.append(1);
    try stack.append(2);
    try stack.append(3);

    for (stack.items, 0..) |item, i| {
        std.debug.print("stack[{}]: {}\n", .{ i, item });
    }

    try expect(stack.pop() == 3);
    try expect(stack.pop() == 2);
    try expect(stack.pop() == 1);
    try expect(stack.popOrNull() == null);

    for (stack.items, 0..) |item, i| {
        std.debug.print("stack[{}]: {}\n", .{ i, item });
    }
}
