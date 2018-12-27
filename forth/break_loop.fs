
: break_in_loop ( -- )
  10 0 DO
    i dup .
    2 * 10 = IF UNLOOP EXIT THEN
  LOOP
;

break_in_loop
CR
.s
