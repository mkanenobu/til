x = 1
1 = x # not error
# 2 = x  # exception

{a, b, c} = {:hello, 1, "str"}
IO.puts a
IO.puts b
IO.puts c

# {a, b} = {:hello, 1, "str"} # exception

# 最初の要素が :ok の場合のみマッチ
{:ok, result} = {:ok, 321}
IO.puts result

# {:ok, result} = {:hoge, 321} # exception

# list head and tail
[head | tail] = [1, 2, 3]
IO.puts head
IO.puts tail == [2, 3]

# discard tail
[head | _] = [1, 2, 3]
IO.puts head
