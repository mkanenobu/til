const debug = @import("std").debug;

// unionの定義
// unionは複数のフィールドを持つが、同時に1つの値しか持てない
// 生のunionはメモリレイアウトが保証されないので、アクティブではないunionのフィールドにアクセスすることは出来ない
const Result = union {
    i: i64,
    f: f64,
    b: bool,
};

// タグ付きunionに使うenumの定義
const Tag = enum { a, b, c };
// タグ付きunionの定義
// タグ付きunionは、enumで定義したタグとそれに対応するフィールドを持つ、どのフィールドがアクティブかを検出できる
const TaggedUnion = union(Tag) {
    a: u8,
    b: f32,
    c: bool,
};

// タグ付きunionのタグのenumの型を推論させることも出来る
// TaggedはTaggedUnionと同等
const Tagged = union(enum) {
    a: u8,
    b: f32,
    c: bool,
};

// voidのフィールドの型は省略出来る
// noneフィールドはvoidになる
const Tagged2 = union(enum) { a: u8, b: f32, c: bool, none };

pub fn run() void {
    const result = Result{ .i = 1234 };
    // 既にiに値が入っているので、fに値を入れることはできない
    // result.f = 12.34;
    debug.print("result = {any}\n", .{result.i});

    var t = TaggedUnion{ .b = 1.5 };
    switch (t) {
        // switchでどのフィールドがアクティブかを検知
        // ペイロードキャプチャを使って値をキャプチャする
        // キャプチャした値自体は変更できないが、値へのポインタをキャプチャすることでdereferenceして値を変更することができる
        .a => |*byte| byte.* += 1,
        .b => |*float| float.* *= 2,
        .c => |*b| b.* = !b.*,
    }
}
