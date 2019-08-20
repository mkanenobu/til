program array_tut;

// カッコ内に列挙型、あるいは事前に定義した列挙型を指定できる。
type
  enum_type = 1..50;
  // 静的配列
  arraytype = array[enum_type] of integer;
  // same as
  // arraytype = array[1..50] of integer;


var
  StaticArray: arraytype;
  // 動的配列
  DynamicArray: array of integer;
  Count:integer;

begin
  for Count := 0 to 10 do
    begin
      StaticArray[count] := Count * 2;
      StaticArray[count] := StaticArray[count] * 2;
    end;

  writeln(StaticArray);

  // 動的配列の長さ宣言
  SetLength(DynamicArray, 10);

  for Count := 0 to 9 do
    DynamicArray[count] := Count * 3;

  writeln('DynamicArray has ', length(DynamicArray), ' elements');
  writeln('Its range is ', low(DynamicArray), ' to ', high(DynamicArray));

end.
