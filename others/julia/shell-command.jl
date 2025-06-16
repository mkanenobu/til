ls = `ls -la`

# run print stdout directory, returns nothing
run(ls)

# read capture
re = read(ls)
println(length(re))

less = `less`
open(less, "w", stdout) do io
  for i = 1:3
    println(io, i)
  end
end
