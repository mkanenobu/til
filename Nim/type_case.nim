proc type_analyse(s:string):string =
    return "string"

proc type_analyse(n:int):string =
    return "num"

echo type_analyse("test")
echo type_analyse(10)
