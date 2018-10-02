#!/usr/bin/lua
L = 20000
total = 0
for i = 0, L, 1 do
    for j = 0, L, 1 do
        total = total + (i * j)
    end
end
