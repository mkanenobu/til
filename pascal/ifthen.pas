program ifthen;

uses StrUtils;

var res: string;

begin
  res := StrUtils.ifThen(true, 'True', 'False');
  writeln(res);
end.
