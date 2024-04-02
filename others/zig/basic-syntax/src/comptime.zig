const debug = @import("std").debug;

fn fibonacci(n: u32) u32 {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

pub fn run() void {
    // コードブロックはcomptimeキーワードでコンパイル時に評価出来る

    // xとyは同じ
    var x = comptime fibonacci(10);
    _ = x;
    var y = comptime blk: {
        break :blk fibonacci(10);
    };
    _ = y;

    comptimeInt();
    comptimeFloat();
    branchingOfTypes();
    typeFunction();
    typeInfoSwitch();
    atTypeExample();
    anyTypeExample();
    arrayRepeatExample();
}

fn comptimeInt() void {
    // 整数リテラルは指定がない場合には comptime_int 型となる
    // comptime_int にはサイズがなく、値を保持出来る任意の整数型になる
    const x = comptime 42;
    debug.print("comptime int type: {}\n", .{@TypeOf(x)});
}

fn comptimeFloat() void {
    // 浮動小数点リテラルは指定がない場合には comptime_float 型となる
    // comptime_float は内部的には f128
    const x = comptime 42.0;
    debug.print("comptime float type: {}\n", .{@TypeOf(x)});
}

fn branchingOfTypes() void {
    const a = 5.5;
    const b: if (a < 10) f32 else i32 = 5;
    debug.print("branching of types: {}\n", .{@TypeOf(b)});
}

// コンパイル時に型を生成する型関数
// 型を返す関数はPascalCaseにする
fn Matrix(
    // 関数パラメータにはcomptimeタグを付けることが出来る
    // これは渡される値がコンパイル時に既知である必要があることを意味する
    comptime T: type,
    comptime width: comptime_int,
    comptime height: comptime_int,
) type {
    return [height][width]T;
}

fn typeFunction() void {
    // 型関数を使って型を生成する
    // この場合はi32の3x3のマトリクスの型を生成する
    var mtrx: ?Matrix(i32, 3, 3) = null;
    debug.print("type function: {}\n", .{@TypeOf(mtrx)});

    debug.print("Matrix(f32, 4, 4) == [4][4]f32: {}\n", .{Matrix(f32, 4, 4) == [4][4]f32});
}

fn addSmallInts(comptime T: type, a: T, b: T) T {
    // typeInfoで場合分けを行う
    // ComptimeIntの場合はそのまま足し算を行う
    // Intの場合はbitsが16以下の場合のみ足し算を行い、それ以外はコンパイルエラーを出す
    // ComptimeIntでもIntでもない場合にはコンパイルエラーを出す
    return switch (@typeInfo(T)) {
        .ComptimeInt => a + b,
        .Int => |info| if (info.bits <= 16) a + b else @compileError("ints too larger"),
        else => @compileError("only ints accepted"),
    };
}

fn typeInfoSwitch() void {
    const x = addSmallInts(i8, 1, 2);
    debug.print("addSmallInts(i8, 1, 2): {}, typeof: {}\n", .{ x, @TypeOf(x) });
}

// @Type 関数で @typeInfo から型を作成できる
// @Type はたいていのプリミティブ型に対して実装されているが、enums, unions, functions, structs などには実装されていない
fn GetBiggerInt(comptime T: type) type {
    // 同じsignednessの1ビット大きい型を返す
    return @Type(.{ .Int = .{
        .bits = @typeInfo(T).Int.bits + 1,
        .signedness = @typeInfo(T).Int.signedness,
    } });
}

fn atTypeExample() void {
    debug.print("GetBiggerInt(i8): {}\n", .{@TypeOf(GetBiggerInt(i8))});
}

// anytype と @TypeOf を使って推論させる
fn plusOne(x: anytype) @TypeOf(x) {
    return x + 1;
}

fn anyTypeExample() void {
    var x = plusOne(@as(u32, 5));
    debug.print("plusOne(5): {}\n", .{@TypeOf(x)});
    // +演算子が実装されていない型の値を渡すとコンパイルエラーになる
    // _ = plusOne("123");
}

fn arrayRepeatExample() void {
    const pattern = [_]u8{ 0xCC, 0xAA };
    const memory = pattern ** 3;
    debug.print("array repeat: {any}\n", .{memory});
}
