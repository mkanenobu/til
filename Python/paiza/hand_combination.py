#!/usr/bin/env python3
n = int(input())
a = []
for i in range(0, n):
    a.append(input())

paper = a.count("paper")
rock = a.count("rock")
scissors = a.count("scissors")

if paper + rock == 0:
    print("draw")
elif paper + scissors == 0:
    print("draw")
elif rock + scissors == 0:
    print("draw")
elif paper == 0:
    print("rock")
elif rock == 0:
    print("scissors")
elif scissors == 0:
    print("paper")
else:
    print("draw")
