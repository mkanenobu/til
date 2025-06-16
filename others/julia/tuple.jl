tu = (1, 2, "Hello")
# 1 based
println(tu[1])
println(tu[3])

named = (first = 100, second = 10)
println(named[1])
println(named.first)

map(x -> x * 10, named) |> println

(a, b, c) = 2:4
println(a, b, c)

println(length(tu))
println(lastindex(tu))
