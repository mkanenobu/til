
: foo 100 throw ;

: foo1 foo ." after foo" ;

: bar ['] foo1 catch ;

bar .

