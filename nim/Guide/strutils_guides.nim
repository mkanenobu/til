import strutils
Whitespace = {' ', '\x09', '\x0B', '\x0D', '\x0A', '\x0C'}
Letters = {'A'..'Z', 'a'..'z'}
Digits = {'0'..'9'}
HexDigits = {'0'..'9', 'A'..'F', 'a'..'f'}
IdentChars = {'a'..'z', 'A'..'Z', '0'..'9', '_'}
IdentStartChars = {'a'..'z', 'A'..'Z', '_'}
NewLines = {'\x0D', '\x0A'}
AllChars = {'\0'..'\xFF'}

