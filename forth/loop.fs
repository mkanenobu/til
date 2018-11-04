\ loop, 最も単純なループ、1づつ増える
\ 上限値、初期値、Do、処理、Loop
: Hello ( -- )
10 0 do CR ." Hello, World!" loop ;
Hello
CR

\ iはカウンタ
: Counter ( -- )
10 0 do i . loop ;
Counter
CR

\ +loop
\ 上限値、初期値、Do、処理、ステップ(nづつ増やす)、Loop
: Plus-Loop ( -- )
10 0 do i . 2 +loop ;
Plus-Loop
CR

\ +loopを使えば1づつ減らす(-1づつ増やす)ことも出来る
: Dec ( -- )
-10 0 do i . -1 +loop ;
Dec
CR
