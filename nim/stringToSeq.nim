import sequtils
let s:string = "Hello"
var sequence:seq[char] = toSeq(s.items)
echo sequence
