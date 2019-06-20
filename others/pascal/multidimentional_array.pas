program multidimentional_array;

// 三目並べのボードの実装
type
  StatusType = (X, O, Blank);
  BoardType = array[1..3, 1..3] of StatusType;

var
  Board: BoardType;
  count1, count2: integer;

begin
  // ボードの初期化
  for count1 := 1 to 3 do
    for count2 := 1 to 3 do
      Board[count1, count2] := Blank;

  // 出力
  for count1 := 1 to 3 do
    for count2 := 1 to 3 do
      write(Board[count1, count2]);

end.
