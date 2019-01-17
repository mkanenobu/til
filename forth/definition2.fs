
5 constant foo
foo .

\ same as
: constant ( w "name" -- )
    create ,
  does> ( -- n )
    ( addr ) @
;
