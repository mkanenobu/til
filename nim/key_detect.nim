import rdstdin
while true:
  try:
    var input = readLineFromStdin("")
    echo input
  except IOError:
    quit 1
