const std = @import("std");
const ArrayList = std.ArrayList;
const mem = std.mem;
const Allocator = mem.Allocator;
const Token = @import("./token.zig").Token;
const Int = @import("./token.zig").Int;
const Operator = @import("./operator.zig").Operator;

const StackError = error{
    StackUnderFlow,
};

pub const Stack = struct {
    stack: std.ArrayList(Int),
    allocator: Allocator,

    const Self = @This();

    pub fn init(allocator: Allocator) Self {
        return .{
            .stack = ArrayList(Int).init(allocator),
            .allocator = allocator,
        };
    }

    pub fn deinit(self: Self) void {
        self.stack.deinit();
    }

    pub fn push(self: *Self, int: Int) !void {
        try self.stack.append(int);
    }

    pub fn evaluate(self: *Self, token: Token) !void {
        switch (token) {
            .int => |i| try self.push(i),
            .op => |op| {
                const right = self.stack.popOrNull().?;
                const left = self.stack.popOrNull().?;
                switch (op) {
                    Operator.plus => try self.push(left + right),
                    Operator.minus => try self.push(left - right),
                    Operator.star => try self.push(left * right),
                    Operator.div => try self.push(@divTrunc(left, right)),
                }
            },
        }
    }
};

test "Stack.init/deinit" {
    const stack = Stack.init(std.testing.allocator);
    defer stack.deinit();
}

test "Stack.evaluate" {
    const expect = std.testing.expect;

    var stack = Stack.init(std.testing.allocator);
    defer stack.deinit();

    try stack.evaluate(Token{ .int = 1 });
    try stack.evaluate(Token{ .int = 2 });
    try stack.evaluate(Token{ .op = Operator.plus });

    try expect(stack.stack.items.len == 1);
    const stackItem = stack.stack.popOrNull().?;
    try expect(stackItem == 3);
}
