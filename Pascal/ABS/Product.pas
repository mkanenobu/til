program ABC86A;

var a, b:integer;

begin
  readln(a, b);
  if a * b mod 2 = 0 then
    writeln('Even')
  else
    writeln('Odd');
end.
