t1 = {1, 2, 3}

IO.puts(
  case t1 do
    {4, 5, 6} ->
      "t1 is {4,5,6}"
    {3 , _, _} ->
      "t1 head is 3"
    {1, 2, 3} ->
      "t1 is {1,2,3}"
  end
)

x = 1
IO.puts(
  case 1 do
    0 -> "Zero"
    ^x -> "same as x"
    _ -> "other"
  end
)

# Guard
IO.puts(
  case {1, 2, 3} do
    # ガード内のエラーはガードに失敗するだけ
    {1, x, 3} when hd(x) ->
      "target is {1, x, 3}, x is list"
    {1, x, 3} when x > 0 ->
      "target is {1, x, 3}, x > 0"
    _ -> "other"
  end
)
