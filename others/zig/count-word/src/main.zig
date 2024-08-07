const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 3) {
        try std.io.getStdErr().writeAll("usage: count-word [FILE] [WORD]\n");
        std.process.exit(1);
    }
    const fileName = args[1];
    const word = args[2];

    const file = try std.fs.cwd().openFile(fileName, .{});
    var bufReader = std.io.bufferedReader(file.reader());
    const reader = bufReader.reader();

    const res = try wordCount(reader, word);
    var stdout = std.io.getStdOut().writer();
    try stdout.print("count: {}\n", .{res});
}

fn wordCount(reader: anytype, word: []const u8) !usize {
    var buffer: [1024]u8 = undefined;
    var count: usize = 0;
    while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        count += countSubString(line, word);
    }
    return count;
}

fn countSubString(str: []const u8, substring: []const u8) usize {
    var count: usize = 0;
    var i: usize = 0;
    while (i < str.len) {
        if (std.mem.startsWith(u8, str[i..], substring)) {
            count += 1;
            i += substring.len;
        } else {
            i += 1;
        }
    }
    return count;
}

test "countSubString" {
    const expect = std.testing.expect;

    var str: []const u8 = "hello world hello world";
    var sub: []const u8 = "hello";
    try expect(countSubString(str, sub) == 2);

    str = "hello world hello world";
    sub = "123";
    try expect(countSubString(str, sub) == 0);
}

comptime {
    std.testing.refAllDecls(@This());
}
