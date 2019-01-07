: fac1 ( n -- n! ) recursive
  dup 0> if
    dup 1- fac1 *
  else
    drop 1
  then
;

5 fac1 .

: fac2 ( n -- n! )
  dup 0> if
    dup 1- recurse *
  else
    drop 1
  then
;

5 fac2 .
