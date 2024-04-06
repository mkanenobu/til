const std = @import("std");
const Operator = @import("./operator.zig").Operator;

pub const Int = i32;

const TokenTag = enum { op, int };
pub const Token = union(TokenTag) {
    op: Operator,
    int: Int,

    pub fn eql(self: Token, other: Token) bool {
        switch (self) {
            .op => |op| {
                return switch (other) {
                    .op => |otherOp| op == otherOp,
                    .int => false,
                };
            },
            .int => |int| {
                return switch (other) {
                    .op => false,
                    .int => |otherInt| int == otherInt,
                };
            },
        }
    }
};

test "Token.eql" {
    const a = Token{ .op = Operator.plus };
    const b = Token{ .op = Operator.plus };
    const c = Token{ .op = Operator.minus };
    const d = Token{ .int = 1 };
    const e = Token{ .int = 1 };

    try std.testing.expect(a.eql(b));
    try std.testing.expect(!a.eql(c));
    try std.testing.expect(!a.eql(d));
    try std.testing.expect(d.eql(e));
}
