# normal
proc f1(n: int) = echo n
f1(10)

# with default value
proc f2(n: int = 0) = echo n
f2()

# varargs, typeof args is Array
proc f3(args: varargs[int]) = echo args
f3(1, 2, 3)

# varargs with map
proc f4(args: varargs[string, `$`]) = echo args
f4(1, "string", 3.14)
