#!/usr/bin/python3.5
print('Input integer, then echoback double\nIf you input "q" break')
num = input()
while True:
    if num == "q":
        break
    print(int(num) * 2)
    num = input()

