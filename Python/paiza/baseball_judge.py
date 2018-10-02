#!/usr/bin/env python3
n = int(input())
s = []
for i in range(0, n):
    s.append(input())


def main():
    bCount = 0
    sCount = 0
    for i in range(0, n):
        if s[i] == "ball":
            bCount += 1
            if bCount == 4:
                print("fourball!")
                break
            print("ball!")
        elif s[i] == "strike":
            sCount += 1
            if sCount == 3:
                print("out!")
                break
            print("strike!")


main()
