const std = @import("std");
const json = std.json;
const print = std.debug.print;

const JsonSchema = struct {
    key: []const u8,
    num: f64,
    nested: Nested,
    array_field: []u8,

    const Nested = struct {
        nested_value: []const u8,
    };
};

pub fn main() !void {
    const json_file = @embedFile("./test.json");

    const allocator = std.heap.page_allocator;

    // validate
    print("json file is valid: {}\n", .{try json.validate(allocator, json_file)});

    // parse
    const parsed = try json.parseFromSlice(JsonSchema, allocator, json_file, .{});
    defer parsed.deinit();

    print("value: {any}\n", .{parsed.value});
    print("key: {s}\n", .{parsed.value.key});

    // stringify
    var buf = std.ArrayList(u8).init(allocator);
    defer buf.deinit();

    try json.stringify(.{
        .key = "こんにちは",
        .number = 3,
        // u8の配列・スライスだと文字列としてエンコードされる
        .array = [_]u4{ 1, 2, 3, 4, 5 },
        .array_of_string = [_][]const u8{ "こんにちは", "これは配列のフィールドです" },
    }, .{ .whitespace = .indent_2 }, buf.writer());
    print("stringified: {s}\n", .{buf.items});
}

test {
    std.testing.refAllDecls(@This());
}
