function sum(x, y)
  x + y
end

println(sum(10, 30))

# like js
sum2(x, y) = x + y
println(sum2(10, 20))

# Can use unicode chars
足す(x, y) = x + y
println(足す(1, 3))

function p(v)
    println(v)
    # return nothing
    return nothing
end
p("aaa")

function optionalArgs(n::Int64 = 1)
    n * 10
end
println(optionalArgs(10))

function varargs(n::Int64, other...) # tuple
    map(x -> x * n, other)
end
println(varargs(3, 1, 3, 2)) # -> (3, 9, 6)
println(varargs(10)) # -> ()

function tup(a::Int64, b::Int64)
    a + b, a * b # return tuple
end
(add, mult) = tup(3, 5)
println(add)
println(mult)

# anonymous function
sum3 = (a::Int64, b::Int64) -> a + b
println(sum3(1, 3))