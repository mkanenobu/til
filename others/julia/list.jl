l = [1, 2, 3, 4, 5]

# 1 based index
println(l[1])

# broadcast
sqrt.(l) |> println # -> [sqrt(1), sqrt(2), ...]
