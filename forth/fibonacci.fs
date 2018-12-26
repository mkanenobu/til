\ print nth of fibonacci seq
: fibo { n1 -- n2 }
  n1 0= if 0 exit then
  n1 1 = if 1 exit then
  0 1
  n1 1 - 0 DO
    2dup +
    rot drop
  LOOP
  swap drop
;

13
fibo .s
