const std = @import("std");
const json = std.json;
const print = std.debug.print;

const Schema = struct {
    key: []const u8,
    num: f64,
    nested: Nested,
    array_field: []const []const u8,

    const Nested = struct {
        nested_value: []const u8,
    };

    
};

pub fn main() !void {
    const json_file = @embedFile("./test.json");

    // validate
    print("json file is valid: {}\n", .{try json.validate(std.heap.page_allocator, json_file)});

    // parse
    const parsed = try json.parseFromSlice(Schema, std.heap.page_allocator, json_file, .{});
    defer parsed.deinit();

    print("value: {any}\n", .{parsed.value});
    print("{s}\n", .{parsed.value.key});

    // stringify
    var buf = std.ArrayList(u8).init(std.heap.page_allocator);
    defer buf.deinit();

    try json.stringify(struct {
        key: []const u8,
        number: u32,
    }{
        .key = "こんにちは",
        .number = 3,
    }, .{ .whitespace = .indent_2 }, buf.writer());
    print("stringified: {s}\n", .{buf.items});
}

test {
    std.testing.refAllDecls(@This());
}
