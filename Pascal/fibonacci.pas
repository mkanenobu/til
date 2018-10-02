program fibonacci;

var a,b,c,i:integer;

begin
  a := 1;
  b := 1;

  for i := 0 to 10 do
    begin
      writeln(b);
      c := a + b;
      a := b;
      b := c
    end;

end.
