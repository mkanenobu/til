let
  state = 0
  global counter
  counter() = state += 1
end;

println(counter())
println(counter())
println(counter())
