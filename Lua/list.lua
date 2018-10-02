local a = {4, 3, 2, 1}

-- 末尾に追加
table.insert(a, 100)

-- 1から5まで
for i = 1, 5 do
    print(i)
end

-- 2から10まで2づつ
for i = 2, 10, 2 do
    print(i)
end

for i, v in pairs(a) do
    print(v)
end
