#!/usr/bin/lua
--[[
nil
boolean
number
string
function
table
thread
userdata
]]

i = 50
print(type(i))
print(type(43))

s = "abcdefg"
print(type(s))
print(type("hoge"))

b = true
print(type(b))

add = function(a, b) return (a + b) end
print(type(add))

function sub(a, b)
    return (a - b)
end
print(type(sub))
