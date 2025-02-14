const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    try stringSwitchTechnic();
}

fn stringSwitchTechnic() !void {
    // 文字列はスライスなのでswitchにそのまま渡せない
    ifPattern("hello");
    ifPattern("world");
    ifPattern("something");
    stringToEnumPattern("hello");
    stringToEnumPattern("world");
    stringToEnumPattern("something");
}

// 1. 普通にifで比較する
fn ifPattern(s: []const u8) void {
    if (std.mem.eql(u8, s, "hello")) {
        print("hello\n", .{});
    } else if (std.mem.eql(u8, s, "world")) {
        print("world\n", .{});
    } else {
        print("else\n", .{});
    }

}

// 2. stringToEnumを使う
fn stringToEnumPattern(s: []const u8) void {
    const Case = enum {
        @"hello",
        @"world",
    };

    if (std.meta.stringToEnum(Case, s)) |case| {
        switch (case) {
            .@"hello" => {
                print("hello\n", .{});
            },
            .@"world" => {
                print("world\n", .{});
            },
        }
    } else {
        print("else\n", .{});
    }
}

test {
    std.testing.refAllDecls(@This());
}
