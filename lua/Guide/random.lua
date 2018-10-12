#!/usr/bin/env lua
-- ランダマイズ
math.randomseed(os.time())

local t = {}

for i = 1, 20 do
    t[i] = math.random(100)
    -- 100までのランダムな値
end

for i,v in ipairs(t) do
    print(i,v)
end
