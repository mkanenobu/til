program recursion;

function summation(num:integer): integer;
begin
  if num = 1 then
    summation := 1
  else
    summation := summation(num - 1) + num
end;

begin
  writeln(summation(3));
  // -> 3 + 2 + 1 = 6
end.
