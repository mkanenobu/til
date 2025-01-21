const std = @import("std");

pub fn main() !void {
    // コンパイル時のファイル埋め込み
    // ファイルからの相対パス
    const file_content = @embedFile("./main.zig");

    std.debug.print("file content: {s}", .{file_content});
}

test {
    std.testing.refAllDecls(@This());
}
