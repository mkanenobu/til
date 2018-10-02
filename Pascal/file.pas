program file_;

var
  filein, fileout:text;
  c:char;
  s:string;

begin
  assign(filein, './example1.txt');
  // fileinを読み込み用にオープン
  reset(filein);

  assign(fileout, './example2.txt');
  // fileoutを書き込み用にオープン
  rewrite(fileout);

  // EOLまで一文字づつ読み込みながら書き込む
  while not eoln(filein) do
    begin
      read(filein, c);
      write(fileout, c);
    end;

  // EOFまで一行づつ読み込みながら書き込む
  while not eof(filein) do
    begin
      readln(filein, s);
      writeln(fileout, s)
    end;

  writeln('Done!');

  close(filein);
  close(fileout);
end.
