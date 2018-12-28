\ this is not work
: tarai { x y z -- n }
  x y <= if y exit then
  x 1- y z recurse y 1- z x recurse z 1- x y recurse recurse
;

12 6 0 tarai
.s
