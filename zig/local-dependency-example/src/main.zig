const std = @import("std");
const hello = @import("hello");

pub fn main() !void {
    std.debug.print("{s}\n", .{hello.hello()});
}

test {
    std.testing.refAllDecls(@This());
}
