program assign_;

var
  some_int:integer;
  some_real:real;

begin
  // たとえば、整数型に実数型を代入することはできないが、
  // あるデータ型は高次のデータ型に変換される。

  // 以下は整数値を実数変数に代入してキャストされる。
  some_int := 375;
  some_real := some_int;
  writeln(some_real);

  // some_int := some_real;  エラー

  // Pascalにおいてマイナス演算子は値をマイナスにするために利用できる
  // 以下のように2つの演算子を並べて使用するとコンパイルエラーになる場合がある
  some_real := 37.5 * -2;
  // 明示的にカッコを使用すればこれを避けられる
  some_real := 37.5 * (-2);
  writeln(some_real);
end.
