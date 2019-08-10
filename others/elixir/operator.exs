# concat strings
IO.puts "Hello, " <> "World!"

# `and` and `or` and `not` takes boolean only
IO.puts true and true
IO.puts true and false
IO.puts true and not false
IO.puts true or false
IO.puts false or false
# IO.puts 1 or false # exception

# `&&` and `||` and `!` takes any type
# `false` と `nil` 以外の全てを true と評価する
# boolean ではなく評価値を返す
IO.puts :atom && true
IO.puts "Hello" || false
IO.puts false || 123
IO.puts ! "string" && 123

IO.puts 1 == 1.0 # true
IO.puts 1 === 1.0 # false

# Elixir では異なる型を比較できる
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
IO.puts :atom > 123
