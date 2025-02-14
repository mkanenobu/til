pub fn run() void {
    const string = [_]u8{ 'a', 'b', 'c' };
    // with index
    for (string, 0..) |char, index| {
        // 未使用の値があるとコンパイルが通らないので _ に代入する
        _ = char;
        _ = index;
    }

    // without index
    for (string) |char| {
        _ = char;
    }

    // only use index
    for (string, 0..) |_, index| {
        _ = index;
    }

    // just loop
    for (string) |_| {}
}
