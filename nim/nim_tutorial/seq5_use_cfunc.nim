# そのままの名前で使用
proc printf(formatstr: cstring) {.header: "<stdio.h>", varargs.}

# 違う名前で使用
proc nim_printf(formatstr: cstring) {.header: "<stdio.h>",importc: "printf", varargs.}

{.compile: "lib/c_code.c".}
proc addTwoInts(a, b: cint): cint {.importc.}

printf("%d\n", 4 * 4)
nim_printf("%d\n", 123)
printf("%d\n", addTwoInts(3, 4))
