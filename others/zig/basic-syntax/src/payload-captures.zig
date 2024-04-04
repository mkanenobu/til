const expect = @import("std").testing.expect;

pub fn run() void {
    optionalIf() catch unreachable;
    errorUnionIf() catch unreachable;
    errorUnionWhile();
    forCapture() catch unreachable;
}

fn optionalIf() !void {
    var maybe_num: ?usize = 10;
    if (maybe_num) |n| {
        try expect(@TypeOf(n) == usize);
        try expect(n == 10);
    } else {
        unreachable;
    }
}

fn errorUnionIf() !void {
    var ent_num: error{UnknownEntity}!u32 = 5;
    if (ent_num) |entity| {
        try expect(@TypeOf(entity) == u32);
        try expect(entity == 5);
    } else |err| {
        _ = err catch {};
        unreachable;
    }
}

fn whileOptional() !void {
    var i: ?u32 = 10;
    while (i) |num| : (i.? -= 1) {
        try expect(@TypeOf(num) == u32);
        if (num == 1) {
            i = null;
            break;
        }
    }
    try expect(i == null);
}

var numbers_left2: u32 = undefined;

// numbers_left2 が0の場合はエラーを、それ以外の場合はnumbers_left2をデクリメントしてその値を返す
fn eventuallyErrorSequence() !u32 {
    return if (numbers_left2 == 0) error.ReachedZero else blk: {
        numbers_left2 -= 1;
        break :blk numbers_left2;
    };
}

fn errorUnionWhile() void {
    var sum: u32 = 0;
    numbers_left2 = 3;

    // eventuallyErrorSequence がエラーを返すとelseに入る
    while (eventuallyErrorSequence()) |value| {
        sum += value;
    } else |err| {
        try expect(err == error.ReachedZero);
    }
}

fn forCapture() !void {
    const x = [_]i8{ 1, 5, 120, -5 };
    for (x) |v| {
        try expect(@TypeOf(v) == i8);
    }
}

const Info = union(enum) {
    a: u32,
    b: []const u8,
    c,
    d: u32,
};

fn switchCapture() void {
    var b = Info{ .a = 10 };
    // タグ付きunionの値をキャプチャ
    const x = switch (b) {
        .b => |str| blk: {
            try expect(@TypeOf(str) == []const u8);
            break :blk 1;
        },
        .c => 2,
        // 型が同じものは同じキャプチャグループに入れられる
        .a, .d => |num| blk: {
            try expect(@TypeOf(num) == u32);
            break :blk num * 2;
        },
    };
    try expect(x == 20);
}
