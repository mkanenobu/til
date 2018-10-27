\ スタック操作

1 .s drop .s
\ 最後の要素を削除
\ 2dropあり
CR

." dup"
1 .s dup .s 2drop .s
\ 最後の要素を複製
\ 2dupあり
CR

." over" CR
1 2 .s over .s 2drop drop
\ 最後から2番目の要素を複製してスタックの最後に追加
\ 2overあり
CR

." swap" CR
3 5 .s swap .s 2drop
\ 最後の要素と最後から2番目の要素を入れ替え
CR

." rot" CR
1 2 3 4 .s rot .s 2drop 2drop
\ rotation 最後から2番目の要素を最後に移動
CR

." swap" CR
1 2 3 4 .s 2swap .s 2drop 2drop
\ ほとんどの重要なワードに2~が存在する
CR

." nip" CR
1 2 3 .s nip .s 2drop
\ 最後から2番目の要素を削除
CR

." tuck" CR
1 2 3 .s tuck .s 2drop drop
\ 最後の要素を最後から2番目の要素の前に挿入
CR
