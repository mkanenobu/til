program if_state;

var n: integer;
    res: integer;

begin
  writeln('Put number');
  readln(n);
  if n mod 3 = 0 then
    begin
      writeln('Can divide by 3!!!');
      res := 3
    end
  else if n mod 4 = 0 then
    begin
      writeln('Cant divide by 4!!!');
      res := 4;
    end
  else
    writeln('Other');
  writeln(res);

end.
