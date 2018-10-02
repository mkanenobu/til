program add_to_array;

// 競プロで使うやつ
var
  arr: array of integer;
  i: integer;

begin
  // 配列の長さ宣言
  setlength(arr, 10);
  // 入力を代入
  for i := 0 to length(arr) - 1 do
    readln(arr[i]);

  // 一つづつ出力
  for i := 0 to length(arr) - 1 do
    writeln(arr[i]);

end.
