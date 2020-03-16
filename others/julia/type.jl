function f(x::Int64)
  x ^ 2
end

println(f(10))

f2(n::Integer) = n ^ 3

# println(f2(10.1)) # Error
println(f2(10)) # Error

