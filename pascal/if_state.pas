program if_state;

var n:integer;

begin
  readln(n);
  if n mod 3 = 0 then
    writeln('Can divide by 3!!!')
  else if n mod 4 = 0 then
    writeln('Cant divide by 4!!!')
  else
    writeln('Other');

end.
