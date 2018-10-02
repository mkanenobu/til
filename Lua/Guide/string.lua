#!/usr/bin/lua
str1 = "Hello"
str2 = "World!"

-- 文字列のサイズ
print(#str1)

-- 文字列連結
print(str1 .. ", " .. str2)

-- 改行入り
lines = ([[おはよう
こんにちは
こんばんは]])
print(lines)

-- スライス
--for i = 1, str1:len() do
--    print(string.sub(str1, i, i))
--end

--for i = 1, #str2 do
--    print(string.sub(str2, i, i))
--end

