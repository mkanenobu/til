const debug = @import("std").debug;

// 構造体の定義
const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,
};

// デフォルト値を持つ構造体の定義
const Vec4 = struct {
    x: f32 = 0,
    y: f32 = 0,
    z: f32 = 0,
    w: f32 = 0,
};

// 構造体にはenumと同様にメソッドを生やせる
const Stuff = struct {
    x: i32,
    y: i32,
    fn swap(self: *Stuff) void {
        const tmp = self.x;
        self.x = self.y;
        self.y = tmp;
    }
};

pub fn run() void {
    const v1 = Vec3{ .x = 1.0, .y = 2.0, .z = 3.0 };
    debug.print("v1 = {any}\n", .{v1});
    // デフォルト値の無いフィールドの初期値を省略することは出来ない
    // const v2 = Vec3{ .x = 1.0, .y = 2.0 };

    // デフォルト値を持つ構造体の初期化、デフォルト値を持つフィールドは初期値を省略できる
    const v2 = Vec4{ .x = 1.0, .y = 2.0 };
    debug.print("v2 = {any}\n", .{v2});

    var thing = Stuff{ .x = 10, .y = 20 };
    thing.swap();
    debug.print("thing = {any}\n", .{thing});
}
