# parametric(like generics) composite
struct Point{T}
  x::T
  y::T
end

Point{Float64}(0.1, 33.3)
Point{String}("0.0", "-10")
# type error
# Point{Int64}(10, 10.1)

# parametric type is not covariant, and not contravariant
# https://docs.julialang.org/en/v1/manual/types/#man-parametric-composite-types
println((Float64 <: Real, Point{Float64} <: Point{Real})) # -> true, false
