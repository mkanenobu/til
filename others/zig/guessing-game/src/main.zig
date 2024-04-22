const std = @import("std");

pub fn main() !void {
    const osSeed = getOsSeed() catch unreachable;
    var prng = std.rand.DefaultPrng.init(osSeed);
    const rand = prng.random();

    const targetNumber = rand.intRangeAtMost(u8, 1, 100);
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    stdout.writeAll("Guess the number!\n");

    while (true) {
        const bareLine = try stdin.readUntilDelimiterAlloc(
            std.heap.page_allocator,
            '\n',
            8192,
        );
        defer std.heap.page_allocator.free(bareLine);

        const line = std.mem.trim(u8, bareLine, "\r");

        const guess = std.fmt.parseInt(u8, line, 10) catch |err| switch (err) {
            error.Overflow => {
                try stdout.writeAll("Please enter a small positive number\n");
                continue;
            },
            error.InvalidCharacter => {
                try stdout.writeAll("Please enter a valid number\n");
                continue;
            },
        };

        if (guess < targetNumber) try stdout.writeAll("Too Small!\n");
        if (guess > targetNumber) try stdout.writeAll("Too Big!\n");
        if (guess == targetNumber) {
            try stdout.writeAll("Correct!\n");
            break;
        }
    }
}

fn getOsSeed() !u64 {
    var seed: u64 = undefined;
    try std.os.getrandom(std.mem.asBytes(&seed));
    return seed;
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

comptime {
    std.testing.refAllDecls(@This());
}
