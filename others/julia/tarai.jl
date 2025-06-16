function tarai(x::Int64, y::Int64, z::Int64)
  if x <= y
    return y
  else
    return tarai(tarai(x - 1, y, z), tarai(y - 1, z, x), tarai(z - 1, x, y))
  end
end

tarai2(x, y, z) =
  if x <= y
    return y
  else
    return tarai(tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y))
  end

println(tarai(12, 6, 0))
println(tarai2(12, 6, 0))
