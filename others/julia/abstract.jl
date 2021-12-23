abstract type Animal end

function getName(animal::Animal)
    animal.name
end

struct Dog <: Animal
    name::String
end

struct Cat <: Animal
    name::String
end

println(Dog("Pochi") |> getName)
println(Cat("Tama") |> getName)
# Dog is Animal's subtype?
println(Dog <: Animal)