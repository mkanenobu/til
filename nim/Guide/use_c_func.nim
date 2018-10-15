proc printf(formatstr: cstring) {.header:"<stdio.h>", varargs.}

printf("%s %d\n", "foo", 5)
