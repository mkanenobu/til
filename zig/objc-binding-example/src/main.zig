const std = @import("std");
const objc = @import("objc");

pub fn main() !void {
    const v = macosGetVersion();
    std.debug.print("{d}.{d}.{d}\n", .{v.major, v.minor, v.patch});

    const isAtLeast = macosVersionAtLeast(11, 0, 0);
    std.debug.print("macOS 11.0.0 or later: {}\n", .{isAtLeast});
}

pub fn macosGetVersion() NSOperatingSystemVersion {
    // ref: https://developer.apple.com/documentation/foundation/nsprocessinfo
    const NSProcessInfo = objc.getClass("NSProcessInfo").?;

    const info = NSProcessInfo.msgSend(objc.Object, "processInfo", .{});

    // argument.
    return info.msgSend(NSOperatingSystemVersion, "operatingSystemVersion", .{});
}

pub fn macosVersionAtLeast(major: i64, minor: i64, patch: i64) bool {
    const NSProcessInfo = objc.getClass("NSProcessInfo").?;

    const info = NSProcessInfo.msgSend(objc.Object, "processInfo", .{});

    return info.msgSend(bool, "isOperatingSystemAtLeastVersion:", .{
        NSOperatingSystemVersion{ .major = major, .minor = minor, .patch = patch },
    });
}

/// This extern struct matches the Cocoa headers for layout.
const NSOperatingSystemVersion = extern struct {
    major: i64,
    minor: i64,
    patch: i64,
};

test {
    std.testing.refAllDecls(@This());
}
