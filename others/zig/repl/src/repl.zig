const std = @import("std");
const fs = std.fs;

fn readLine(reader: fs.File.Reader, buffer: []u8) !?[]u8 {
    return try reader.readUntilDelimiterOrEof(buffer, '\n');
}

pub fn repl(reader: fs.File.Reader, writer: fs.File.Writer) !void {
    var buffer: [1024]u8 = undefined;

    while (true) {
        try writer.writeAll("> ");
        const input = (try readLine(reader, &buffer)).?;
        try writer.writeAll("you entered: ");
        try writer.writeAll(input);
        try writer.writeAll("\n");
    }
}
