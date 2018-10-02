#!/usr/bin/lua
io.write("Hello\n") --改行
print[[エスケープシーケンス無視，\n, \t]]
for i = 0, 100 do
    io.write(string.format(i, "\r")) --型変換
end
