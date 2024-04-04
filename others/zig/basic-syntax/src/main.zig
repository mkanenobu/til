const std = @import("std");
const assignment = @import("assignment.zig");
const arrays = @import("arrays.zig");
const ifExpressions = @import("if-expressions.zig");
const whileLoops = @import("while-loops.zig");
const forLoops = @import("for-loops.zig");
const functions = @import("functions.zig");
const deferExample = @import("defer.zig");
const errors = @import("errors.zig");
const switchExample = @import("switch.zig");
const runtimeSafety = @import("runtime-safety.zig");
const pointer = @import("pointer.zig");
const slices = @import("slices.zig");
const enums = @import("enums.zig");
const structs = @import("structs.zig");
const unions = @import("unions.zig");
const integerRules = @import("integer-rules.zig");
const floats = @import("floats.zig");
const labels = @import("labels.zig");
const optionals = @import("optionals.zig");
const comptimeExample = @import("comptime.zig");
const payloadCaptures = @import("payload-captures.zig");

// ref: https://zig.guide/
pub fn main() !void {
    assignment.run();
    arrays.run();
    ifExpressions.run();
    whileLoops.run();
    forLoops.run();
    functions.run();
    deferExample.run();
    errors.run() catch {};
    switchExample.run();
    runtimeSafety.run();
    pointer.run();
    slices.run();
    enums.run();
    structs.run();
    unions.run();
    integerRules.run();
    floats.run();
    labels.run();
    optionals.run();
    comptimeExample.run();
    payloadCaptures.run();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
