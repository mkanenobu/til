\ loop, 最も単純なループ、1づつ増える
\ 上限値、初期値、Do、処理、Loop
: Hello ( -- )
  10 0
  DO CR ." Hello, World!" LOOP
;

Hello
CR

\ iはカウンタ
: Counter ( -- )
  10 0
  DO i . LOOP
;

Counter
CR

\ +loop
\ 上限値、初期値、Do、処理、ステップ(nづつ増やす)、Loop
: Plus-Loop ( -- )
  10 0
  DO i . 2 +LOOP
;

Plus-Loop
CR

\ +loopを使えば1づつ減らす(-1づつ増やす)ことも出来る
: Dec ( -- )
  -10 0
  DO i . -1 +LOOP
;

Dec
CR
