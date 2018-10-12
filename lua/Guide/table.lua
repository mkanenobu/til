#!/usr/bin/env lua

-- テーブルは1から始まる

-- 空のテーブル
a = {}

a[1] = "Foo"
a['hoge'] = 42
print(a.hoge)
-- a.hoge == a['hoge']
print(a[0]) -- nil
print()

t = {hoge=1, 9, 3, [0] = 'p', ['bar']=7, 5}

-- テーブルの中身を巡回
-- for i,v in pairs(t) do
--     -- tの各キー，値のペアに対して，以下を実行する
--     print(i,v)
-- end

print()

--t2 = {3,2,1}
--for i = 1, #t do
--    print(t2[i])
--end

math.randomseed(os.time()) -- 乱数の初期化
randomTable1 = {}
randomTable2 = {}

for j = 1, 100 do
    randomTable1[j] = math.random(100)
    randomTable2[math.random(100)] = j
    -- キーは1以上100以下の一様乱数
end

-- pairsで参照される順番は不定
print("pairs")
for i,v in pairs(randomTable2) do
    print(i,v)
end

-- a[1],a[2].. と参照したい場合はipairsを使う
print("ipairs")
for i,v in ipairs(randomTable1) do
    print(i,v)
end
