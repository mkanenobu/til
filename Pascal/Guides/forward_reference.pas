program forward_reference;

// 前方参照
// 終わりにforwardをつければ良い

procedure later(parameter list); forward;

procedure sooner(parameter list);

begin
  later(parameter list);
end;

procedure later;
begin
  sooner(parameter list);
end;
