const debug = @import("std").debug;

fn addFive(x: u32) u32 {
    return x + 5;
}

// 再帰、末尾再帰に最適化はされないのでスタックオーバーフローする可能性がある
fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

pub fn run() void {
    const x: u32 = 5;
    debug.print("x + 5 = {}\n", .{addFive(x)});

    const n: u16 = 10;
    debug.print("fibonacci({}) = {}\n", .{ n, fibonacci(n) });
}
