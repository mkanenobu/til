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

    var stdoutWriter = std.io.getStdOut().writer();
    var stdinReader = std.io.getStdIn().reader();

    var tokenBuffer = ArrayList(token.Token).init(allocator);
    defer tokenBuffer.deinit();

    startRepl(stdinReader, stdoutWriter, &stack) catch unreachable;
}

fn startRepl(reader: anytype, writer: anytype, stack: *Stack) !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();
    var tokenBuffer = ArrayList(token.Token).init(allocator);
    defer tokenBuffer.deinit();

    var inputBuffer: [1024 * 1024]u8 = undefined;

    while (true) {
        try writer.writeAll("> ");
        const input = (try readLine(reader, &inputBuffer)).?;

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
    std.testing.refAllDecls(@This());
}
