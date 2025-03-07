const debug = @import("std").debug;

pub fn main() void {
    labeledBlock();
    labeledLoop();
    loopAsExpression();
}

fn labeledBlock() void {
    // ラベル付きブロックを使うことでブロックから値を返すことができる
    // ↓はblkというラベル付きブロックを作って、`break :blk sum;` でsumの値を返している
    const count = blk: {
        var sum: u32 = 0;
        var i: u32 = 0;
        while (i < 10) : (i += 1) sum += i;
        break :blk sum;
    };
    debug.print("count: {}\n", .{count});
}

fn labeledLoop() void {
    // ラベル付きループ
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |j| {
            count += 1;
            if (j == 2) {
                continue :outer;
            }
        }
    }
    debug.print("count: {}\n", .{count});
}

fn rangeAsNumber(begin: usize, end: usize, number: usize) bool {
    var i = begin;
    // ループを式として使うこともできる
    return while (i < end) : (i += 1) {
        if (i == number) {
            break true;
        }
        // zigのループにはelseもあり、、ループがbreakで終了しない場合に評価される
    } else false;
}

fn loopAsExpression() void {
    debug.print("rangeAsNumber(1, 10, 5): {}\n", .{rangeAsNumber(1, 10, 5)});
    debug.print("rangeAsNumber(1, 10, 11): {}\n", .{rangeAsNumber(1, 10, 11)});
}
