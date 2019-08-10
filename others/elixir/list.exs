# listは線形な処理用
# list is immutable
l1 = [1, 2, true, 3, "four"]

# concat
IO.puts([1, 2, 3] ++ [4, 5, 6] == [1, 2, 3, 4, 5, 6])
IO.puts([1, true, false] -- [true, false] == [1])

IO.puts(hd(l1))
IO.puts(tl(l1) == [2, true, 3, "four"])

# リストを文字列として解釈しようとする
IO.puts(["Hello, ", "World!"])
IO.puts([104, 101, 108, 108, 111])

# シングルクォートとダブルクォートは違う型を持つ
# char list
single = 'hello'
# string
double = "hello"
IO.puts(single == double)

