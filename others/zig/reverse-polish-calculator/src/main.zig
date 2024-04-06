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
    defer {
        stack.deinit();
        const gpaDeinitStatus = gpa.deinit();
        std.debug.assert(gpaDeinitStatus == .ok);
    }

    var stdoutWriter = std.io.getStdOut().writer();
    var stdinReader = std.io.getStdIn().reader();

    var tokenBuffer = ArrayList(token.Token).init(allocator);
    defer tokenBuffer.deinit();

    try startRepl(stdinReader, stdoutWriter, &stack);
}

fn startRepl(reader: anytype, writer: anytype, stack: *Stack) !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var allocator = gpa.allocator();
    var tokenBuffer = ArrayList(token.Token).init(allocator);
    defer {
        tokenBuffer.deinit();
        const gpaDeinitStatus = gpa.deinit();
        std.debug.assert(gpaDeinitStatus == .ok);
    }

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

test "startRepl" {
    var stack = Stack.init(std.testing.allocator);
    defer stack.deinit();

    // var tmpDirIterable = std.testing.tmpIterableDir(.{}).iterable_dir;
    // // Use tmp file instead of stdin for testing
    // var file = try tmpDirIterable.dir.createFile("test.txt", .{ .read = true });
    // var reader = file.reader();
    // var arr = std.ArrayList(u8).init(std.testing.allocator);
    // var writer = arr.writer();

    // try startRepl(reader, writer, &stack);
}

comptime {
    std.testing.refAllDecls(@This());
}
