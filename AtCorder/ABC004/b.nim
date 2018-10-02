import  sequtils, strutils, algorithm, math

var
  c1 = reversed(readLine(stdin).split)
  c2 = reversed(readLine(stdin).split)
  c3 = reversed(readLine(stdin).split)
  c4 = reversed(readLine(stdin).split)

proc main(c: seq[string]) =
  for i in 0..3:
    stdout.write(c[i])
    if i != 3:
      stdout.write(' ')
    else:
      stdout.write("\n")

main(c4)
main(c3)
main(c2)
main(c1)
