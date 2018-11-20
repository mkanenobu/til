program fizzbuzz;

var i:integer;

begin
  for i := 0 to 100 do
    if (i mod 5 = 0) and (i mod 3 = 0) then
      writeln('Fizzbuzz')
    else if i mod 5 = 0 then
      writeln('Buzz')
    else if i mod 3 = 0 then
      writeln('Fizz')
    else
      writeln(i);
end.
