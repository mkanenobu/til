var
    a = "Abstract"
    b = "Bake"
raiseAssert("Failed yeah")
failedAssertImpl("failed impl")
proc main():int =
    raise newException(Exception, "Failed yeah")

assert(a == "AB", b)

echo main()
