a, b = 0, 1
function fibo(n)
  res = ""
  for i = 0, n do
    res = res .. (b .. ", ")
    a, b = b, a + b
  end
  return res
end

print(fibo(50))
