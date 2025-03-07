const debug = @import("std").debug;

pub fn main() void {
    var x: u8 = 32;
    // Zigの通常のポインタは値として0やnullを持つことが出来ない
    // 参照は &variable、デリファレンスは variable.* で行う
    increment(&x);
    debug.print("x = {}\n", .{x});

    // 0はポインタの値として不正なので、以下のコードはエラーになる
    // var y: u16 = 0;
    // var z: *u8 = @ptrFromInt(y);
    // _ = z;

    // constポインタ
    const y: u8 = 1;
    const z = &y;
    _ = z;
    // constポインタは変更出来ないので以下のコードはエラーになる
    // z.* += 1;
}

fn increment(num: *u8) void {
    num.* += 1;
}
