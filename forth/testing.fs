: square ( n1 -- n2 )
  dup *
;

s" ~/.forth_dicts/test.fs" included
\ include ~/.forth_dicts/test.fs

\ if false, throw error
T{ 3 square -> 9 }T
T{ 1 square -> 1 }T
T{ 4 square -> 13 }T \ throw error
