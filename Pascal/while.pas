program while_state;

var i:integer = 0;

begin

  while i < 100 do
    begin
      write(i);
      write(',');
      i := i + 1
    end;

end.
