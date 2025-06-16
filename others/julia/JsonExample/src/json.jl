module json

using JSON

d = Dict("name" => "John Doe", "age" => 29)

j = d |> JSON.json
j |> println
j |> JSON.parse |> println

end # module json
