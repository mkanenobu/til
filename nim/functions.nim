import sugar

# normal
proc f1(s: string): string = "Hello, " & s

# bind anonymous function
const f2: proc(s: string): string = proc(s: string): string = "Hello, " & s

# f2 style with sugar (like js)
const f3: string -> string = (s: string) => "Hello, " & s

echo f1("John")
echo f2("John")
echo f3("John")

