proc f(args: varargs[string, `$`]): seq[string] =
  return system.`@`(args)

# ($123, $"string", $0.231)
echo f(123, "string", 0.231)
