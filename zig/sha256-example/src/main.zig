const std = @import("std");
const Sha256 = std.crypto.hash.sha2.Sha256;
const print = std.debug.print;

pub fn main() !void {
    const hash = try calculateSha256Digest("Hello, World!");
    print("Hash: {x}\n", .{hash});
}

pub fn calculateSha256Digest(data: []const u8) ![Sha256.digest_length]u8 {
    var sha256 = Sha256.init(.{});
    sha256.update(data);
    return sha256.finalResult();
}

test {
    std.testing.refAllDecls(@This());
}
