const debug = @import("std").debug;

// float型は `@setFloatMode(.Optimized)` が設定されない限りは IEEE に準拠する
pub fn main() void {
    // floatはより大きい型にwideningされる
    const a: f16 = 0;
    const b: f16 = a;
    const c: f128 = b;
    _ = c;

    // 複数の記法をサポート
    const floating_point: f64 = 123.0E+77;
    const another_float: f64 = 123.0;
    const yet_another: f64 = 123.0e+77;
    _ = .{ floating_point, another_float, yet_another };

    const hex_floating_point: f64 = 0x103.70p-5;
    const another_hex_float: f64 = 0x103.70;
    const yet_another_hex_float: f64 = 0x103.70P-5;
    _ = .{ hex_floating_point, another_hex_float, yet_another_hex_float };

    // _ 付き
    const lightspeed: f64 = 299_792_458.000_000;
    const nanosecond: f64 = 0.000_000_001;
    const more_hex: f64 = 0x1234_5678.9ABC_CDEFp-10;
    _ = .{ lightspeed, nanosecond, more_hex };

    // floatとintの相互変換
    const i: i32 = 0;
    // @floatFromIntは常に安全だが、@intFromFloatは範囲外の場合にエラーになる
    const f: f16 = @floatFromInt(i);
    const int2: i32 = @intFromFloat(f);
    _ = .{ i, f, int2 };
}
