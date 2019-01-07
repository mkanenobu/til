: sample1 ( n1 -- n2 )
  >r >r r> 999 r>
;

include ~/.forth_dicts/test.fs

T{ 3 4 sample1 -> 3 999 4 }T
T{ 54 32 sample1 -> 54 999 32 }T

: foo ( n1 n2 -- )
  .s
  >r .s
  r@ .
  >r .s
  r@ .
  r> .
  r@ .
  r> . ;

1 2 foo CR

: swap { n1 -- }
  >r r> n1
;

1 2 swap .s
