const std = @import("std");

pub const Operator = enum {
    plus,
    minus,
    star,
    div,

    pub fn fromChar(char: u8) ?Operator {
        return switch (char) {
            '+' => Operator.plus,
            '-' => Operator.minus,
            '*' => Operator.star,
            '/' => Operator.div,
            else => null,
        };
    }

    pub fn toChar(self: Operator) u8 {
        return switch (self) {
            Operator.plus => '+',
            Operator.minus => '-',
            Operator.star => '*',
            Operator.div => '/',
        };
    }

    pub fn format(
        self: Operator,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        _ = fmt;
        _ = options;

        const char = self.toChar();
        try writer.print("{}", .{char});
    }
};

test "Operator.fromChar" {
    const plus = Operator.fromChar('+');
    const minus = Operator.fromChar('-');
    const star = Operator.fromChar('*');
    const div = Operator.fromChar('/');

    try std.testing.expect(plus == Operator.plus);
    try std.testing.expect(minus == Operator.minus);
    try std.testing.expect(star == Operator.star);
    try std.testing.expect(div == Operator.div);
}

test "Operator.toChar" {
    const plus = Operator.plus;
    const minus = Operator.minus;
    const star = Operator.star;
    const div = Operator.div;

    try std.testing.expect(plus.toChar() == '+');
    try std.testing.expect(minus.toChar() == '-');
    try std.testing.expect(star.toChar() == '*');
    try std.testing.expect(div.toChar() == '/');
}
