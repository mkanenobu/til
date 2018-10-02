program math;

uses math;

var
  n:integer = 2;
  e:integer = 2;
  f:real = 2.7;

begin
  // nのe乗
  writeln(power(n, e):0:0);
  // 丸め込み
  writeln(round(f));
  // 切り捨て
  writeln(trunc(f));
end.
