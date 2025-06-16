fibonacci(n::Int) = begin
  fibo(n::Int, a::Int, b::Int) = begin
    n == 0 && return a
    fibo(n - 1, b, a + b)
  end

  fibo(n, 0, 1)
end

map(fibonacci, 0:10) |> println
