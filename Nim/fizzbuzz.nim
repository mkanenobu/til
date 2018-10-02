#var
#    x = 100
#for i in 1..x:
#    if i mod (3*5) == 0: stdout.write "Fizzbuzz"
#    elif i mod 5 == 0: stdout.write "Buzz"
#    elif i mod 3 == 0: stdout.write "Fizz"
#    else:  stdout.write i
#echo ""
for i in 1..100:
    if i mod 15 == 0: echo "FizzBuzz"
    elif i mod 3 == 0: echo "Fizz"
    elif i mod 5 == 0: echo "Buzz"
    else: echo i
