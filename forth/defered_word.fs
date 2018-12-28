Defer square

: bar ( -- )
  10 square
  .s
;

:noname ( n1 -- n2 )
  dup *
; IS square

bar
