# 一度に出力
var str = ""
for i in 1..100:
    if i mod 3 == 0 and i mod 5 == 0: str.add "FizzBuzz\n"
    elif i mod 3 == 0: str.add "Fizz\n"
    elif i mod 5 == 0: str.add "Buzz\n"
    else: str.add $i & "\n"
write stdout, str
