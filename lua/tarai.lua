#!/usr/bin/env lua5.3
function tak(x, y, z)
  if x <= y then
    return y
  else
    return tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
  end
end

print(tak(12,6,0))
