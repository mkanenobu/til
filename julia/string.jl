s = "Hello"

println("$s, World!")

s = """
1
2
3
"""

println(s)

println("1 + 2 = 3" == "1 + 2 = $(1 + 2)")

println(repeat("abc ", 3))

arr = ["I'm", "Happy", "Today"]

println(join(arr, " "))

# regex
regex_pattern = r"^(a|b|c)d$"
println(typeof(regex_pattern))
# occursin is returns true if matched
println(occursin(regex_pattern, "ad"))
println(occursin(regex_pattern, "aad"))
