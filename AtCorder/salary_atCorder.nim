import strutils
var
    N = parseInt(stdin.readLine)
    salary: int

for i in 1..N:
    salary = salary + i
salary = toInt(salary * 10000 / N)
echo salary
