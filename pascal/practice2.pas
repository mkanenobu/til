program practice2;

const NumberOfInteres = 5;
var
  a,b,c,d,e:integer;
  sum:integer;
  average:real;

begin
  read(a); read(b); read(c); read(d); read(e);
  writeln('Number of integers = ', NumberOfInteres);
  writeln('');
  writeln('Number1:', a:8);
  writeln('Number2:', b:8);
  writeln('Number3:', c:8);
  writeln('Number4:', d:8);
  writeln('Number5:', e:8);
  writeln('================');
  sum := a + b + c + d + e;
  writeln('Sum:', sum:12);
  average := sum / NumberOfInteres;
  writeln('Average:', average:10:1);

end.
