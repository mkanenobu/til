const std = @import("std");
// const lib = @import("dependent-return-type_lib");
const builtin = std.builtin;
const Type = builtin.Type;

pub fn main() !void {
    const a: []const u8 = dependentReturnType(u8);
    std.debug.print("{s}, {any}\n", .{a, @TypeOf(a)});

    const b: i8 = dependentReturnType([]const u8);
    std.debug.print("{d}, {any}\n", .{b, @TypeOf(b)});

    const c: []const u8 = dependentToValue(null);
    std.debug.print("{s}, {any}\n", .{c, @TypeOf(c)});

    std.debug.print("{s}\n", .{typeName(0)});
    std.debug.print("{s}\n", .{typeName(.{})});
}

// Either Type
// 渡した型によって返り値の型が変わる
fn dependentReturnType(comptime T: type) switch (@typeInfo(T)) {
    .int => []const u8,
    else => i8,
} {
    return switch (@typeInfo(T)) {
        .int => "int",
        else => 9,
    };
}

// 渡した値の型によって返り値の型が変わる
fn dependentToValue(v: anytype) switch (@typeInfo(@TypeOf(v))) {
    .int, .null => []const u8,
    else => i8,
} {
    return switch (@typeInfo(@TypeOf(v))) {
        .int => "int",
        .null => "null",
        else => 9,
    };
}

// 値の型情報で分岐
fn typeName(v: anytype) []const u8 {
    return switch (@typeInfo(@TypeOf(v))) {
        Type.int, .comptime_int => "int",
        .null => "null",
        .@"struct" => "struct",
        else => "other type",
    };
}

test {
    std.testing.refAllDeclsRecursive(@This());
}
