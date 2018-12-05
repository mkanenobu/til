program max;

procedure MaxNum(a, b: Integer): Integer;
// Local variables
var c: integer;
begin
  if a < b then
    c := b
  else if a > b then
    c := a
  else
    c := 9999;
  MaxNum := c;
end;

begin
  writeln(MaxNum(10, 6));
end.
