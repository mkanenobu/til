import sequtils, strutils, nre

proc cipher(s: string): string =
  for i in s:
    if i.isLowerAscii:
      result &= chr(219 - ord(i))
    else:
      result &= i

echo "Hello, World!".cipher
echo "Hello, World!".cipher.cipher

