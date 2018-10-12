#!/usr/bin/env lua5.3

-- 初期値、終了値、増加量
for i = 0, 10, 1 do
    print(i)
end

--
j = 0
while j < 10 do
    print(j)
    j = j + 1
end

--
k = 0
repeat
    print(k)
    k = k + 1
until k > 10
