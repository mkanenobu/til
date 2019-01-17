
: local-stack
  { n1 n2 n3 -- n } \ この記法はコンパイルされて>l, @local0, 1, 2になる
  n1 n2 n3 . . .
;

1 2 3 local-stack
see local-stack

31 .s
>l .s
@local0 .s
