import algorithm
# sort method require "algorithm"

var
    x = @[1,15,3,2]
    cities = @["Frankfurt", "Tokyo", "New York", "Kyiv"]
    test = @["XYZ", "ABC", "IJK","M", "JK"]

# primitive
sort(test) do (x,y:string) -> int:
    cmp(x[0], y[0])
echo test

# dest
echo cities
sort(cities) do (x,y:string) -> int:
    cmp(x.len, y.len)
echo cities

echo x

# int
sort(x,system.cmp[int])
echo x
reverse(x)
echo x
