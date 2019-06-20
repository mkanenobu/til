program complecated_if;

const
  bool1:boolean = false;
  bool2:boolean = false;

begin

  // elseは常に直前のifとマッチする
  // なので空のelseを使う
  if bool1 = true then
    if bool2 = true then
      writeln('Both true')
    else // 空else
  else
    writeln('Both is false');

end.

