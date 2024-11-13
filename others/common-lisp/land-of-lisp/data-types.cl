#!/usr/bin/env sbcl --script

; シンボル
; シンボルは大文字と小文字が区別されない
; printは値を標準出力に出力して引数の値を評価値として返す、他の一般的な言語と異なり行末ではなく行頭に改行が入る
(print (eq 'fooo 'fOOo))

; 数値
; floatとintの両方がサポートされている
; ほとんどの算術関数はfloatとintを混ぜるとfloatになる
(print (+ 1 1.0))
(print (expt 53 66))
; int同士の除算は有理数を返す、有理数なので誤差が出ない
(print (/ 4 6)) ; 2/3
; floatが含まれると結果が変わる
(print (/ 4.0 6))

; terpriは改行を出力
(terpri)

; 文字列
; princはエスケープ（""）・改行なしで値を出力して引数に渡した値を評価値として返す
; これをREPLで実行すると123（改行）"123"と出る（前者が標準出力への出力で、後者はprincの評価値）
(princ "Tutti Frutti")
; 文字列内のダブルクォートのエスケープ
(print "I say \"Hello, World!\"")

; 文字
(print #\a)
