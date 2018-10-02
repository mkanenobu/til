program Shift_Only;

label 1;
var
  n, i, j, ans:integer;
  a:array of integer;

begin
  ans := 0;
  read(n);
  setlength(a, n);
  for i := 1 to n do
    read(a[i]);

  while true do
    begin
      for i := 1 to n do
        begin
          if a[i] mod 2 <> 0 then
            goto 1;
        end;
      ans := ans + 1;

      for i := 1 to n do
        a[i] := a[i] div 2
    end;

  1:
  writeln(ans);

end.
