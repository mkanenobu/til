program dictinary;

// レコード型(辞書型)
{*
type
  TypeName = record
    識別子リスト1: データ型1;
    ...
    識別子リストn: データ型n;
  end;
*}
type
  InfoType = record
    name: string;
    age: integer;
    city, state: string;
    zip: integer;
  end;

var Info: InfoType;

// 変数識別子.フィールド識別子で要素にアクセスできる
// ひとつのレコード型変数を長く用いるつもりで、変数名を繰り返し繰り返しタイプしたくないなら、変数名を除いて、フィールド識別子だけを用いることができる。

// with レコード型変数 do
begin
  with Info do
    begin
      name := 'John';
      age := 18;
      city := 'Kurashiki';
      state := 'Okayama';
      zip := 711;
      writeln('Name is ', name);
    end;

  writeln('Age is ', Info.age);
  writeln('City is ', Info.city);
end.
