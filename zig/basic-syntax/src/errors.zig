const dbg = @import("std").debug;
const expect = @import("std").testing.expect;

// エラーセットを定義する
// エラーは値である
const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};

// FileOpenErrorのサブセットのAllocationErrorを定義
const AllocationError = error{OutOfMemory};

pub fn main() !void {
    const err: FileOpenError = AllocationError.OutOfMemory;
    // サブセットはスーパーセットと同じになる
    dbg.print("AllocationError.OutOfMemory == FileOpenError.OutOfMemory: {}\n", .{err == FileOpenError.OutOfMemory});

    // !演算子でユニオンを作ることが出来る
    // 下記はAllocationErrorかu16のどちらかを持つユニオン型の値
    const maybe_error: AllocationError!u16 = 10;
    // catchでフォールバック値を指定することが出来る
    const no_error = maybe_error catch 0;
    // ユニオンからエラーが外れてu16になる
    dbg.print("no_error type: {}\n", .{@TypeOf(no_error)});

    // エラーの握りつぶし
    errorCatchSyntax() catch {};

    // try x は `x catch |err| return err` のショートカット
    // |err| はラムダ式ではないので、このreturnはラムダ式の返却値になるわけではなく、外側の関数のreturnとなる
    // try expect(1 == 2);

    // errdeferはdeferと同様の挙動をするが、ブロックからエラーが返されたときだけ実行される
    failFnCounter() catch |e| {
        try expect(e == error.Oops);
        try expect(problems == 99);
    };

    const x: error{SomethingHappened}!void = inferedError();
    dbg.print("x: {any}\n", .{x});
    _ = x catch {};
}

// エラーセットはマージ可能
const A = error{ NotDir, PathNotFound };
const B = error{ OutOfMemory, PathNotFound };
const C = A || B;
// anyerrorはグローバルエラーセットであり、全てのエラーセットのスーパーセット
// 通常は利用しない方がいい
const AnyError = anyerror;

fn errorCatchSyntax() !void {
    // |err| シンタックス（ペイロードキャプチャ）でエラーをキャッチできる
    // これは専用のシンタックスでラムダ関数ではない
    _ = failingFunction() catch |e| {
        return e;
    };
}

// 関数はエラーユニオンを返すことが多い
fn failingFunction() error{Oops}!void {
    return error.Oops;
}

var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunction();
}

// 返しうるエラーの型を明示的に指定する必要はなく、コンパイラに推論させることも出来る（こちらの方が一般的）
fn inferedError() !void {
    return error.SomethingHappened;
}
