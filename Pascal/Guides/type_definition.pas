program type_definition;

type
  // enum型の定義
  MonthType = (January, Febrary, March, April,
              May, June, July, August, September,
              October, November, December);

  // 部分範囲型
  DaysOfWeek = (Sunday, Monday, Tuesday, Wednesday,
                Thursday, Friday, Saturday);
  WorkDays = Monday .. Friday;

var
  Month: MonthType;

begin
  Month := January;
  writeln(Month);
  // 順序値
  writeln(ord(Month));
  // 次の値
  writeln(succ(Month));
end.
