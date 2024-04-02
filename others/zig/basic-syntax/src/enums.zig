const debug = @import("std").debug;
const expect = @import("std").testing.expect;

// enumを定義
const Direction = enum { north, south, east, west };

// enumはintegerのタグタイプを持つことが出来る
const Value = enum(u32) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
    next, // will be 1000001
};

const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,
    // Enumにはメソッドを生やせる
    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

const Mode = enum {
    // var, constでenumの中に変数・定数を定義することも出来る
    // これらは単に名前空間付きのグローバル値として機能する（enumのインスタンスとは関係ない）
    var count: u32 = 0;
    const constants: i32 = 1;
    on,
    off,
};

pub fn run() void {
    enum_tag() catch {};
    enum_methods();
    enum_var();
}

fn enum_tag() !void {
    try expect(@intFromEnum(Value.hundred) == 100);
    try expect(@intFromEnum(Value.thousand) == 1000);
    try expect(@intFromEnum(Value.million) == 1000000);
    try expect(@intFromEnum(Value.next) == 1000001);
}

fn enum_methods() void {
    debug.print("Suit.clubs.isClubs() = {}\n", .{Suit.clubs.isClubs()});
    debug.print("Suit.isClubs(Suite.spades) = {}\n", .{Suit.isClubs(Suit.spades)});
    debug.print("Suit.isClubs(.hearts) = {}\n", .{Suit.isClubs(.hearts)});
}

fn enum_var() void {
    Mode.count += 3;

    debug.print("Mode.count = {}\n", .{Mode.count}); // -> 3
    // これは出来ない
    // Mode.on.count += 1;
}
