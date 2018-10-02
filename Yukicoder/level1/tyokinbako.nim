import sequtils, strutils

var
    c100 = readLine(stdin).parseInt
    c25 = readLine(stdin).parseInt
    c1 = readLine(stdin).parseInt

c25 += c1 div 25
c100 += c25 div 4
c1 = c1 mod 25
c25 = c25 mod 4
c100 = c100 mod 10

echo c1 + c25 + c100
