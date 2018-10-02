program ABC081A;

var
  i, ans:integer;
  s:string;

begin
  read(s);
  ans := 0;

  for i := 1 to 3 do
    if s[i] = '1' then
      ans := ans + 1;

  writeln(ans);
end.
