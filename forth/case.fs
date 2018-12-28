: case_test ( n1 -- n2 )
  dup
  CASE
  1 OF drop ." This is 1, and replace to 111" 111 CR ENDOF
  2 OF drop ." This is 2, and replace to 222" 222 CR ENDOF
  3 OF drop ." This is 3, and replace to 333" 333 CR ENDOF
  ( default ) ." This is" SPACE dup . CR
  ENDCASE
;


3
case_test
.s CR

5
case_test .s
