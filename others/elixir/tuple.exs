# tupleはランダムアクセスを行う用

# tuple is immutable
t1 = {:ok, "hello"}
# target, index
IO.puts elem(t1, 1)
IO.puts tuple_size(t1)

# target, index, element
t1 = put_elem(t1, 1, 123)
IO.puts elem(t1, 1)
