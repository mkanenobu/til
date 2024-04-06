const std = @import("std");
const ArrayList = std.ArrayList;
const mem = std.mem;
const stack = @import("./stack.zig");
const Operator = @import("./operator.zig").Operator;
const token = @import("./token.zig");
const Token = token.Token;

pub fn tokenize(input: []const u8, buffer: *ArrayList(Token)) !void {
    var iter = mem.split(u8, input, " ");
    while (iter.next()) |fragment| {
        const t = try parseFragment(fragment);
        try buffer.append(t);
    }
}

fn parseFragment(fragment: []const u8) !Token {
    if (fragment.len == 1) {
        const char = fragment.ptr[0];
        if (Operator.fromChar(char)) |op| {
            return Token{ .op = op };
        }
    }

    const int = try std.fmt.parseInt(token.Number, fragment, 10);
    return Token{ .n = int };
}

test "tokenize" {
    const expect = std.testing.expect;

    var buffer = ArrayList(Token).init(std.testing.allocator);
    defer buffer.deinit();

    const input = "1 + 2 * 3 / 4 - 10";
    const expected = [_]Token{ .{ .n = 1 }, .{ .op = Operator.plus }, .{ .n = 2 }, .{ .op = Operator.star }, .{ .n = 3 }, .{ .op = Operator.div }, .{ .n = 4 }, .{ .op = Operator.minus }, .{ .n = 10 } };

    try tokenize(input, &buffer);

    try expect(buffer.items.len == expected.len);

    for (expected, 0..) |expectedToken, i| {
        const actualToken = buffer.items[i];
        try expect(actualToken.eql(expectedToken));
    }
}
