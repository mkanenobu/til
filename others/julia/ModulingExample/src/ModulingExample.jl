module ModulingExample

include("other/OtherModule.jl")
using .OtherModule

greet() = println("Hello World!")

main() = begin
  greet()
  OtherModule.greet()
end

end # module ModulingExample
