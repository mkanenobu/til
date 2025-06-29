module CsvExample

using CSV
using DataFrames

main() = begin
  # CSVファイルをDataFrameとして読み込む
  df = CSV.read("./example.csv", DataFrame)

  println(df)
  println(size(df))

  # a列の値を取得
  df[:, :a] |> println
  # 1行目の値を取得
  df[1, :] |> println
  # 2行目のc列の値を取得
  df[2, :c] |> println

  # a列の値が3より大きい行をフィルター
  subset(df, :a => n -> n .> 3) |> println

  df[:, :c] |> sum |> println
end

end # module CsvExample
