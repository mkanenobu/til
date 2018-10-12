echo "Counting to ten: "

for i in countup(1, 10):
# or #for i in 1..10:
# or #for i in 0..<10:  # 0..9
# or #var s = "some strings"
# for i in 0..<s.len:
    echo i


var num = 1
while num <= 10:
    echo num
    inc(num)  # increment num by 1

echo "Counting down from 10 to 1"
for down in countdown(10, 1):
    echo down

var s = "some string"
for num2 in 0..<s.len: # s.len=11
    echo num2

for index, item in ["a", "b"].pairs:
    echo item, " at index ", index
# => a at index 0
# => b at index 1
