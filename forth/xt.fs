#! /usr/bin/env gforthrun

' + dup
3 2 rot execute .s
4 rot execute .s
CR


: map-array ( ... addr u xt -- ... )
  \ execute xt ( ... x -- ... ) for every element of the array starting
  \ at addr and containing u element
  { xt }
  cells over + swap ?do
    i @ xt execute
  1 cells +loop
;

create v 3 , 4 , 2 , -1 , 4 ,

\ a 5 cells dump

v 5 ' . map-array .s CR
0 j 5 ' + map-array .s CR

s" max-n" environment? 2drop .s
CR
v 5 ' min map-array . CR


: foo1 ( n1 n2 -- n )
  [ ' + compile, ]
;
1 2 foo1 . CR
see foo1
