
: odd_or_even ( n -- )
  1 +
  0 DO
    i dup . 2 mod 0=
      IF ." is even."
      ELSE ." is odd."
    THEN
    CR
  LOOP
;

10
odd_or_even
