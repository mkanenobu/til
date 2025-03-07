const std = @import("std");
const meta = std.meta;
const debug = std.debug;
const expect = std.testing.expect;

pub fn main() void {
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

    vectorScalar();
    vectorLoop();
    coerceToArray();
}

fn vectorScalar() void {
    // 組み込みの@splat関数で全ての値が同じVectorを作成できる
    const x: @Vector(3, f32) = .{ 12.5, 37.5, 2.5 };
    // 全ての値が2のVectorを作ってxと掛け合わせる
    const y = x * @as(@Vector(3, f32), @splat(2));
    expect(meta.eql(y, @Vector(3, f32){ 25, 75, 5 })) catch unreachable;
}

fn vectorLoop() void {
    // Vectorはlen属性を持たないが、インデックスアクセスが可能なので長さが分かっていればループ出来る
    const x = @Vector(4, u8){ 255, 0, 255, 0 };
    const sum = blk: {
        var tmp: u32 = 0;
        var i: u8 = 0;
        while (i < 4) : (i += 1) tmp += x[i];
        break :blk tmp;
    };
    expect(sum == 510) catch unreachable;
}

fn coerceToArray() void {
    const arr: [4]f32 = @Vector(4, f32){ 1, 2, 3, 4 };
    _ = arr;
}
