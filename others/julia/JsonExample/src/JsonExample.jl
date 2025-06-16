module JsonExample

using JSON

main() = begin
  d = Dict(
      "name" => "John Doe",
      "age" => 29,
      "nested" => Dict(
          "address" => "123 Main St",
          "city" => "Anytown",
          "state" => "CA"
      ),
  )

  j = d |> JSON.json
  j |> println
  j |> JSON.parse |> println
end

end # module JsonExample
