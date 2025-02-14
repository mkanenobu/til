const debug = @import("std").debug;

pub fn run() void {
    // hex, octal, binaryフォーマットが利用できる
    const decimal_int: i32 = 98222;
    const hex_int: u8 = 0xff;
    const hex_int_2: u8 = 0xFF;
    const octal_int: u8 = 0o77;
    const binary_int: u8 = 0b11110000;

    _ = .{ decimal_int, hex_int, hex_int_2, octal_int, binary_int };

    // _で資格的に区切ることができる
    const one_billion: u64 = 1_000_000_000;
    const binary_mask: u64 = 0b1_1111_1111;
    const permissions: u64 = 0o7_5_5;
    const big_address: u64 = 0xFF80_0000_0000_0000;

    _ = .{ one_billion, binary_mask, permissions, big_address };

    // integerのwidening
    // 新しい型が元の型の全ての値の範囲を地れる場合に限って、ある型の整数を別の整数の型に変換できる
    const a: u8 = 250;
    const b: u16 = a;
    const c: u32 = b;
    _ = c;

    // wideningが使えない変換の場合でも @intCast で変換できる
    // 値が変換先の型の範囲外の場合にはエラーになる
    const x: u64 = 200;
    const y = @as(u8, @intCast(x));
    _ = y;

    // 通常はオーバーフローは許可されておらず、エラーになるがオーバーフロー演算子を利用することでオーバーフロー出来る
    var n: u8 = 255;
    // これは範囲外になるのでエラーになる
    // n += 1;
    // += のオーバーフロー版 +%=、通常の演算子の後に%が付く
    n +%= 5;
    debug.print("a + 5 = {}\n", .{n}); // -> 4
}
