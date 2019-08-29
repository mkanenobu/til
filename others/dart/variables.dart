main() {
  // 型宣言付き
  String s = '';
  s = 'Hello, World!';
  // 型推論 (Style guideでは `var` が推奨されている)
  var name = 'Bob';

  // 型が単一では無い場合 `dynamic` か `Object` を使用する
  dynamic v1 = '123';
  Object v2 = 123;
  v1 = 123;
  v2 = '123';

  // 初期化していない変数の初期値は `null`
  int v3;
  assert(v3 == null);

  // 定数, 型宣言はあってもなくてもいい
  // トップレベルで `final` 宣言されたものは使用される時に初期化される

  // `const`宣言はインスタンス変数には使用できず、
  // `final`もコンストラクタが開始する前にコンストラクタパラメータ、
  // またはコンストラクタの初期化リストで初期化する必要がある
  final int oneTwoThree = 123;
  // コンパイル時評価定数
  const threeTwoOne = 321;

  // `const`キーワードは定数宣言だけのものではない
  // 低数値を作成したり、低数値を作成するコンストラクタを宣言できる
  // どの変数も低数値を持てる

  var foo = const [];
  final bar = const [];
  const baz = []; // `const []` と等しい
  // 上記の baz のように `const` 宣言の場合は初期化式から `const` を省略出来る
  // 初期化値が `const` でも変更出来る
  foo = [1, 2, 3];
}
