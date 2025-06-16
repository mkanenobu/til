macro show_expr(expr)
  return :(println("expr: ", $(string(expr))))
end

macro show_expr2(expr)
  return quote
    println("expr: ", $(string(expr)))
  end
end

@show_expr 1 + 2
@show_expr2 1 + 2

macro exec_with_log(expr)
  return quote
    println("expr: ", $(string(expr)))
    $expr
  end
end

println(@exec_with_log 1 + 2)
