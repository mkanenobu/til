program practice1;

const
  NumberOfIntegers = 5;
  a = 45;
  b = 7;
  c = 68;
  d = 2;
  e = 34;
var
  Sum:integer;
  Average:real;

begin
  Sum := a + b + c + d + e;
  Average := Sum / NumberOfIntegers;
  writeln('Number of integers = ', NumberOfIntegers);
  writeln('Number1 = ', a);
  writeln('Number2 = ', b);
  writeln('Number3 = ', c);
  writeln('Number4 = ', d);
  writeln('Number5 = ', e);
  writeln('Sum = ', Sum);
  writeln('Average = ', Average);

end.
