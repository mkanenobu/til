program scope;

var a:integer; // グローバル

procedure scopeInner;
  var a:integer; // ローカル
  begin
    a := 10;
    writeln(a)
  end;

begin {* main *}
  a := 20;
  writeln(a);
  scopeInner;
  writeln(a);
end.

{* 出力
*  20
*  10
*  20
*}
