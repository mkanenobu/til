: sample1 ( n1 -- n2 )
  >r >r r> 999 r>
;

include ~/.forth_dicts/test.fs

T{ 3 4 sample1 -> 3 999 4 }T
T{ 54 32 sample1 -> 54 999 32 }T
