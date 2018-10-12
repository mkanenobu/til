n = int(input())
d, x = map(int, input().split())
a = [int(input()) for i in range(n)]
c = 0

for i in range(n):
    for j in range(1, d + 1):
        if (1 + j * a[i]) <= d:
            c += 1

print(n + c + x)
