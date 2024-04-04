const std = @import("std");
const meta = std.meta;
const debug = std.debug;
const expect = std.testing.expect;

pub fn run() void {
    // zigはSIMDのVector型を提供している
    // これは数学的なVectorやC++のstd::vectorとは異なる（std.ArrayListがstd::vectorに近い）

    // Vectorは(bool, int, float, ポインタ)の子タイプのみを持つことができる
    const x: @Vector(4, f32) = .{ 1, -10, 20, -1 };
    const y: @Vector(4, f32) = .{ 2, 10, 0, 1 };
    // それぞれの要素同士を足し合わせる
    const z = x + y;
    expect(meta.eql(z, @Vector(4, f32){ 3, 0, 20, 0 })) catch unreachable;
    debug.print("z = {any}\n", .{z});
    // インデックスアクセス可能
    debug.print("first element of z: {}\n", .{z[0]});
}
