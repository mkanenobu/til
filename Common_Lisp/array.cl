; 配列の生成
(format t "~A~%" (make-array 5))

; 初期値の設定
(format t "~A~%" (make-array 3 :initial-contents '(4 6 1)))

; 二次元配列の生成。多次元配列はリストで指定
(format t "~A~%" (make-array '(2 3) :initial-contents '((1 2 3) (4 5 6))))

; 初期値の設定
(format t "~A~%" (make-array '(2 3) :initial-element 1))

; 配列の型の指定
(format t "~A~%" (make-array 3 :element-type 'character
                             :initial-contents '(#\x #\y #\z)))


(format t "~A~%" (make-array 3 :element-type 'float
                      :initial-contents '(1.1 2.2 3.3)))
