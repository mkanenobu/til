const std = @import("std");
const testing = std.testing;

pub fn hello() []const u8 {
    return "Hello, World!";
}

test {
    std.testing.refAllDecls(@This());
}
