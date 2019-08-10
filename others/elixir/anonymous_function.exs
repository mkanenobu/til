add = fn a, b -> a + b end

IO.puts is_function(add)
# call anonymous function
IO.puts add.(1, 2)

# is `add` function takes 2 args?
IO.puts is_function(add, 2) # true
# is `add` function takes 1 arg?
IO.puts is_function(add, 1) # false
