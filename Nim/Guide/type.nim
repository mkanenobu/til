import typetraits

type
    myInt = int

let
    a:int = 2
    b:myInt = myInt(4)

echo a + myInt(3) + b

# | is or
proc double[T:int | int16 | int32](x:T):T =
    return x + x

# Numeric types
echo "SomeSignedInt = int | int8 | int16 | int32 | int64"
echo "SomeUnsignedInt = uint | uint8 | uint16 | uint32 | uint64"
echo "SomeInteger = SomeSignedInt | SomeUnsignedInt"
echo "SomeOrdinal = int | int8 | int16 | int32 | int64 | bool | enum | uint8 | uint16 | uint32"
echo "SomeReal = float | float32 | float64"
echo "SomeNumber = SomeInteger | SomeReal"

# 0からint型の最大値まで
echo "Natural = range[0 .. high(int)]"

# Type detection
echo a.type.name
echo a.type
echo b.type
