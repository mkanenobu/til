import base64

var str = encode("Hello, World!")
echo str

echo decode(str)

var encodeInts = encode([1,2,3])
echo encodeInts

var encodeChars = encode(['h','e','y'])
echo encodeChars
