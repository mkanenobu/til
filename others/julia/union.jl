IntOrString = Union{Int,AbstractString}

1::IntOrString
"Hello"::IntOrString
# error
# 1.0::IntOrString

Option = Union{T,Nothing}
