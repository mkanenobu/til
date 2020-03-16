import os, std/sha1

var hashText = ""

for f in walkDirRec("."):
  hashText &= $secureHashFile(f)

echo secureHash(hashText)
