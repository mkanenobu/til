import sequtils, strutils
import filename

let fileString = readFile(filepath)

echo fileString.replace("\t", " ")

