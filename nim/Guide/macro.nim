import macros
macro test1(s:string):untyped =
    echo treeRepr(s)
discard test1("Hello")
