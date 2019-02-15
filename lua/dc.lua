#!/usr/bin/env lua5.3

-- Forth style reverse polish calculator impletation in lua

function string:split(delimiter)
  local sep, fields = delimiter or " ", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

local function calc(stack, elem)
  local tmp
  if elem == "+" then
    tmp = table.remove(stack)
    table.insert(stack, table.remove(stack) + tmp)
  elseif elem == "-" then
    tmp = table.remove(stack)
    table.insert(stack, table.remove(stack) - tmp)
  elseif elem == "*" then
    tmp = table.remove(stack)
    table.insert(stack, table.remove(stack) * tmp)
  elseif elem == "/" then
    tmp = table.remove(stack)
    table.insert(stack, table.remove(stack) / tmp)
  elseif elem == "." then
    print(table.remove(stack))
  elseif elem == ".s" then
    print(table.concat(stack, ", "))
  else
    table.insert(stack, elem)
  end
end

local stack = {}

while true do
  local line = io.read():split(" ")
  for _, v in ipairs(line) do
    calc(stack, v)
  end
end
