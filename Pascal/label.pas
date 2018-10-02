var i:integer;
// ラベル宣言
label 1;

begin
  for i := 0 to 100 do
    begin
      write(i);
      write(',');
      if i = 20 then
        begin
          goto 1
        end;
    end;


  1:
  writeln('test');
end.
