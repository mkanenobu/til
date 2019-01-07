: PrintHello
." Hello" CR ;
\ :でワード定義開始, ;で終了

PrintHello

\ local var
: _swap { a b -- b a }
  b a
;

5 1 _swap .s
