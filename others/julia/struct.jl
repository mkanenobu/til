struct MyDate
  year::Int
  month::Int
  day::Int

  # 内部コンストラクタ
  # フィールドをそのまま取るコンストラクタが自動で生成されるのでそのままでいいときは必要ない
  function MyDate(year::Int, month::Int, day::Int)
    if month < 1 || month > 12
      throw(ArgumentError("Month must be between 1 and 12"))
    end
    if day < 1 || day > 31
      throw(ArgumentError("Day must be between 1 and 31"))
    end
    new(year, month, day)
  end
end

OptionalInt = Union{Int,Nothing}

# 外部コンストラクタ
# 内部コンストラクタを定義するより多重定義が出来るのを利用して外部コンストラクタを定義する方が望ましい
MyDate(year::OptionalInt, month::OptionalInt, day::OptionalInt) = begin
  unwrap(v::OptionalInt, default::Int) = v === nothing ? default : v

  MyDate(unwrap(year, 2023), unwrap(month, 1), unwrap(day, 1))
end

MyDate(2025, 1, 30) |> println
MyDate(2025::OptionalInt, 1::OptionalInt, 30::OptionalInt) |> println

# 可変なstruct（=デフォルトはimmutable）
mutable struct Coodinates
  x::Int
  y::Int
  # 変更不可なフィールド
  const description::AbstractString
end

distance(c1::Coodinates, c2::Coodinates)::Float64 = begin
  dx = c1.x - c2.x
  dy = c1.y - c2.y
  sqrt(dx^2 + dy^2)
end

c1 = Coodinates(0, 0, "Origin")
c2 = Coodinates(3, 4, "Point")
distance(c1, c2) |> println
c2.x = 6  # mutableなので変更可能
distance(c1, c2) |> println
