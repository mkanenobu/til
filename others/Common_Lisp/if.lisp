; (if P then else)
; 式 P の評価結果が真のときには式thenを評価し、 偽のときはelseを評価する。返り値は評価した式の評価結果である。
(format t "~A~%" (if t 11 24))
(format t "~A~%" (if nil 11 24))



; (progn E0 E1 E2...)
; progn は、ただ引数を左から順に評価する。 progn の返り値は、最後に評価した式の返り値である。 if の引数のように、 1つの式しか書けないところに複数の式を書くために用いられる。 C 言語の {〜}、Pascal の begin〜end と同じである
(setq hoge t)
; hogeがnilでないなら、hoge=1,fuga=2。hoge が nil なら、hoge=0,fuga=1。
(if hoge (progn
          (setq hoge 1)
          (setq fuga 2))
        (progn
          (setq hoge 0)
          (setq fuga 1)))


; (cond (P0 E00 E01 E02...)
;       (P1 E10 E11 E12...)
;       (P2 E20 E21 E22...)
;       ...
;       (Pn En0 En1 En2...))

; P0を評価し、真ならE00,E01,E02...を評価して終了する。P0が偽ならP1を評価し、P1が真ならE10,E11,E12を評価して終了する。
; つまり
; 1, P0~Pnは順に評価される
; 2, 評価結果が真になるものがあると、 それに対応する Ex0 Ex1 Ex2 ... を評価して終了する
; if~elseif~ の連続のようなもの
