const std = @import("std");
const fs = std.fs;

fn readLine(reader: fs.File.Reader, buffer: []u8) !?[]u8 {
    return try reader.readUntilDelimiterOrEof(buffer, '\n');
}

pub fn repl(reader: fs.File.Reader, rawWriter: fs.File.Writer) !void {
    var writer = std.io.bufferedWriter(rawWriter);
    var buffer: [1024]u8 = undefined;

    while (true) {
        _ = try writer.write("> ");
        try writer.flush();

        const input = try readLine(reader, &buffer);
        if (input == null) {
            // EOF
            break;
        }
        const i = input.?;
        _ = try writer.write("you entered: ");
        _ = try writer.write(i);
        _ = try writer.write("\n");
        try writer.flush();
    }
}
