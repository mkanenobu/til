\ #! /usr/bin/env gforthrun

: fizzbuzz
  1 Do
    i 5 mod 0=
    i 3 mod 0=
    2dup or 0=
    if i 1 .r then
    if ." Fizz" then
    if ." Buzz" then
  44 EMIT
  LOOP ;

101 fizzbuzz
