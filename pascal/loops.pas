program loops;

var n,i,j:integer;

begin
	n := 0;

	while n < 10 do
		begin
			write(n);
			write(',');
			n := n + 1;
		end;
	writeln();

	n := 0;
	writeln('偽である限り繰り返される、最低一回は実行される');
	repeat
        write(n);
        write(',');
        n := n + 1;
    until n > 10;
    writeln();
	
	writeln('0から10までカウントアップ');
	for i := 0 to 10 do
		begin
			write(i);
			write(',');
		end;


    writeln();
	writeln('10から0までカウントダウン');
	for j := 10 downto 0 do
		begin
			write(j);
			write(',');
		end;

end.
