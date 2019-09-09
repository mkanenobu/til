import sequtils, strutils, parsecsv
import filename

var
  parser: CSVParser
  col1, col2: seq[string]
parser.open(filename = filepath, separator = '\t')

while parser.readRow:
  col1.add(parser.row[0])
  col2.add(parser.row[1])

"col1.txt".writeFile(col1.join("\n"))
"col2.txt".writeFile(col2.join("\n"))
