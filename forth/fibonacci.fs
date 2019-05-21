\ print nth of fibonacci seq
: fibo1 ( n1 -- n2 )
  >r
  r@ 0=  if 0 exit then
  r@ 1 = if 1 exit then
  0 1
  r> 1 DO
    2dup +
    rot drop
  LOOP
  nip
;

13 fibo1 . CR


: fibo2 { n -- n1 }
  n 0=  if 0 exit then
  n 1 = if 1 exit then
  0 1
  n 1 DO
    2dup +
    rot drop
  LOOP
  nip
;

13 fibo2 . CR
