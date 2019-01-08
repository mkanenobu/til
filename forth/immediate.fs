
: [FOO] ( -- )
  5 .
; immediate

[FOO]

: bar ( -- )
  [FOO]
;

bar
see bar

CR
CR

: flip ( -- )
  6 . ; compile-only

\ flip  Error

: flop ( -- )
  flip ;

flop CR

: xxx ( -- )
  [ 5 . ]
;
xxx
see xxx
