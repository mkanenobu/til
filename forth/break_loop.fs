: break_loop ( -- )
  10 0 DO
    i dup .
    5 = IF LEAVE THEN
  LOOP
  ." last"
;

: exit_in_loop ( -- )
  10 0 DO
    i dup .
    2 * 10 = IF UNLOOP EXIT THEN
  LOOP
  ." last"
;

break_loop
CR

exit_in_loop
CR
