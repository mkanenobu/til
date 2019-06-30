\ print nth of fibonacci seq
: fibo { n -- n1 }
  n 1 <= if n exit then
  0 1
  n 1 DO
    2dup +
    rot drop
  LOOP
  nip
;

10 fibo . CR

: fibo_recurse { n -- n }
  n 1 <= if n exit then

  n 1 - recurse
  n 2 - recurse
  +
;

10 fibo_recurse . CR
