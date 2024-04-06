const std = @import("std");
const Operator = @import("./operator.zig").Operator;

pub const Number = i32;

const TokenTag = enum { op, n };
pub const Token = union(TokenTag) {
    op: Operator,
    n: Number,

    pub fn eql(self: Token, other: Token) bool {
        switch (self) {
            .op => |op| {
                return switch (other) {
                    .op => |otherOp| op == otherOp,
                    .n => false,
                };
            },
            .n => |n| {
                return switch (other) {
                    .op => false,
                    .n => |otherN| n == otherN,
                };
            },
        }
    }
};

test "Token.eql" {
    const a = Token{ .op = Operator.plus };
    const b = Token{ .op = Operator.plus };
    const c = Token{ .op = Operator.minus };
    const d = Token{ .n = 1 };
    const e = Token{ .n = 1 };

    try std.testing.expect(a.eql(b));
    try std.testing.expect(!a.eql(c));
    try std.testing.expect(!a.eql(d));
    try std.testing.expect(d.eql(e));
}
