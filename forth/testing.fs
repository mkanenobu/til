: square ( n1 -- n2 )
  dup *
;

include ~/.forth_dicts/test.fs

\ if false, throw error
T{ 3 square -> 9 }T
T{ 1 square -> 1 }T
