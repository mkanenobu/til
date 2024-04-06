const std = @import("std");
const ArrayList = std.ArrayList;
const Stack = @import("./stack.zig").Stack;
const token = @import("./token.zig");
const readLine = @import("./readline.zig").readLine;
const tokenize = @import("./tokernizer.zig").tokenize;
const utils = @import("./utils.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();
    var stack = Stack.init(allocator);
    defer stack.deinit();

    var inputBuffer: [1024 * 1024]u8 = undefined;
    var writer = std.io.getStdOut().writer();
    var stdinReader = std.io.getStdIn().reader();

    var tokenBuffer = ArrayList(token.Token).init(allocator);
    defer tokenBuffer.deinit();

    while (true) {
        try writer.writeAll("> ");
        const input = (try readLine(stdinReader, &inputBuffer)).?;

        tokenize(input, &tokenBuffer) catch |err| {
            utils.printErr("{}\n", .{err});
            continue;
        };

        defer tokenBuffer.clearRetainingCapacity();
        for (tokenBuffer.items) |t| {
            try stack.evaluate(t);
        }
        utils.print("{any}\n", .{stack.stack.items});
    }
}

comptime {
    _ = @import("./stack.zig");
    _ = @import("./tokernizer.zig");
    std.testing.refAllDecls(@This());
}
