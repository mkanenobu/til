program practice3;
// http://wiki.freepascal.org/Programming_Assignment_3/ja
uses math;

var
  num:integer = 0;

begin
  while power(2, num) < 20000 do
    begin
      write(power(2, num):0:0, ', ');
      if (num + 1) mod 5 = 0 then
        writeln;
      num := num + 1
    end;
  writeln;

end.
