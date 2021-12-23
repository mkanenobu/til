#=
needs `JSON`
=#
using JSON

d = Dict(
    "name" => "John Doe",
    "age" => 29,
)

d |> JSON.json |> println