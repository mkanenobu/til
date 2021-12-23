function f(x::Int64)
  x ^ 2
end

n = 10
println(typeof(n)) # -> Int64
println(f(n))

f2(n::Integer) = n ^ 3

# println(f2(10.1)) # Error
println(f2(10)) # Error

