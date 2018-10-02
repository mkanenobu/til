program test;

function multi(num:integer): integer;
begin
  // 返り値は関数名に代入
  multi := num * num
end;

var n:integer;

begin
  read(n);
  writeln(multi(n));
end.
