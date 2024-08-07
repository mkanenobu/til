const std = @import("std");
const ArrayList = std.ArrayList;
const Stack = @import("./stack.zig").Stack;
const token = @import("./token.zig");
const readLine = @import("./readline.zig").readLine;
const tokenize = @import("./tokernizer.zig").tokenize;
const utils = @import("./utils.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var stack = Stack.init(allocator);
    var tokenBuffer = ArrayList(token.Token).init(allocator);
    defer {
        stack.deinit();
        tokenBuffer.deinit();
        _ = gpa.deinit();
    }

    const stdoutWriter = std.io.getStdOut().writer();
    const stdinReader = std.io.getStdIn().reader();

    var thread = try std.Thread.spawn(.{ .allocator = allocator }, startRepl, .{ stdinReader, stdoutWriter, &stack, &tokenBuffer });
    thread.join();
}

fn startRepl(reader: anytype, writer: anytype, stack: *Stack, tokenBuffer: *ArrayList(token.Token)) !void {
    var inputBuffer: [1024 * 1024]u8 = undefined;

    while (true) {
        defer tokenBuffer.clearRetainingCapacity();

        try writer.writeAll("> ");
        // Wait for input
        const input = (try readLine(reader, &inputBuffer)) orelse {
            continue;
        };

        tokenize(input, tokenBuffer) catch |err| {
            utils.printErr("{}\n", .{err});
            continue;
        };
        for (tokenBuffer.items) |t| {
            try stack.evaluate(t);
        }
        utils.print("{any}\n", .{stack.stack.items});
    }
}

comptime {
    std.testing.refAllDecls(@This());
}
