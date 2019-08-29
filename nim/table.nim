import tables

assert {1: "One", 2: "Two"} == [(1, "One"), (2, "Two")]
var
  tuple1 = {1: "one", 2: "two"}
  # toTable(pairs: openarray[(A, B)]): Table[A, B]
  table1 = tuple1.toTable
  initializedTable = initTable[int, string]()

initializedTable[1] = "1st element"
initializedTable.add(key = 2, val = "2nd element")
echo initializedTable[1]
echo initializedTable[2]

echo tuple1[1]
echo table1[1]

