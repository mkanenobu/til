const debug = @import("std").debug;

// 構造体の定義
const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,
};

pub fn run() void {
    const v1 = Vec3{ .x = 1.0, .y = 2.0, .z = 3.0 };
    debug.print("v1 = {any}\n", .{v1});
    // デフォルト値の無いフィールドの初期値を省略することは出来ない
    // const v2 = Vec3{ .x = 1.0, .y = 2.0 };
}
