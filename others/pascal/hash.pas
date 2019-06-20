program hash;

uses md5;

var
  Password, PasswordHash: string;

begin
  Password := 'test';
  writeln(MD5Print(MD5String(Password)));

end.
