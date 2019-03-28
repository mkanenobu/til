: tarai1 { x y z -- n }
  x y <= if y exit then
  x 1- y z recurse y 1- z x recurse z 1- x y recurse recurse
;

12 6 0 tarai1 .

: tarai2 recursive { x y z -- n }
  x y <= if y exit then
  x 1- y z tarai2 y 1- z x tarai2 z 1- x y tarai2 tarai2
;

12 6 0 tarai2 .
