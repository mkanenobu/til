#!/usr/bin/env lua5.3
math.randomseed(os.time())

t = {}
for i = 1, 10 do
    --10から90まで
    t[i] = math.random(10, 90)
end

for i,v in pairs(t) do
    print(v)
end

print([[
Sort
]])

-- ソート
table.sort(t)
for i,v in pairs(t) do
    print(v)
end
