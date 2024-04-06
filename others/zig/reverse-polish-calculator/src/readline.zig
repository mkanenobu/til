const std = @import("std");

pub fn readLine(reader: anytype, buffer: []u8) !?[]const u8 {
    var line = try reader.readUntilDelimiterOrEof(
        buffer,
        '\n',
    ) orelse return null;
    // trim annoying windows-only carriage return character
    if (@import("builtin").os.tag == .windows) {
        return std.mem.trimRight(u8, line, "\r");
    } else {
        return line;
    }
}
