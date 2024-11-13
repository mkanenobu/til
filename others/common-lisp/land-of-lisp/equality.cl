; 4.4 比較関数

; 比較演算子はいくつかある
; equal, eql, eq, =, string-equal, equalp あたりがよく使われる

; Land of Lispの著者のルールとして
; 1. シンボル同士は常に eq で比較する
; 2. シンボル同士の比較でなければ equal を使う
; というものがある

; シンボル同士の比較
; eqは全てのLispの比較関数の中で最も簡単で速いが基本的にはシンボル同士の比較にしか使えない
(defparameter *fruit* 'apple)
(print (cond ((eq *fruit* 'apple) 'its-an-apple)
             ((eq *fruit* 'orange) 'its-an-orange)))
; eqはコンス同士の比較にも使えるが、同値性ではなく同一性の比較になるのであまり使い道が無い

; シンボル同士以外
; equalは基本的なLispのデータ型全てに使える
; シンボル
(print (equal 'apple 'apple))
; リスト
(print (equal (list 1 2 3) (list 1 2 3)))
; 異なる方法で作られたリストでも中身が同じなら同じ
(print (equal '(1 2 3) (cons 1 (cons 2 (cons 3 ())))))
; 整数同士
(print (equal 4 4))
; 浮動小数点同士
(print (equal 2.5 2.5))
; 文字列同士
(print (equal "foo" "foo"))
; 文字同士
(print (equal #\a #\a))

; その他

; eqlはeqと似ているがシンボル以外（数値と文字）も比較可能
(print (eql 3.4 3.4))
(print (eql #\a #\a))

; equalpはequalとほぼ同じだが文字列同士の比較がcase in-sensitiveだったり整数と浮動小数点の比較が出来るなど少し賢い
(print (equalp "Bob Smith" "bob smith"))
(print (equalp 3 3.0))

; さらにそれ以外は特定のデータ型に特化したもの
; =が数値、string-equalが文字列、char-equalが文字など
