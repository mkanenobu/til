; 5
; 魔法使いのアドベンチャー

; このゲームでは魔法使いの弟子になり、魔法使いの館を探索する
; 最終的にはパズルを解いて魔法のドーナツを得ることが出来るようになる

; このゲームの世界
; （5.1の図を参照）

; プレイヤーは3つの場所を行き来することが出来る
; 居間・屋根裏・庭
; 居間と屋根裏間は梯子で移動でき、居間と庭はドアで移動できる、屋根裏と庭間の移動は出来ない

; 基本的な要求仕様
; ゲームプログラムはいくつかの基本的な操作をサポートする必要がある
; - 周囲を見渡す
; - 別の場所に移動する
; - オブジェクトを拾う
; - 拾ったオブジェクトでなにかする

; この章では3つの機能を実装する
; オブジェクトごとに固有のアクションをとるには後の章で説明されるLispのもう少し進んだ機能を使う必要があるので、それ以外の部分を実装する

; ゲーム世界を見渡すということは各場所において以下の3種類のものを見ることが出来るということ
; - 基本となる景色
; - 1つ以上の他の場所につながる通り道
; - 手に取り操作できるオブジェクト

(defparameter *nodes* '((living-room (you are in the living-room.
                                      a wizard is snoring loudly on the couch.))
                        (garden (you are in the beautiful garden.
                                 there is a well in front of you.))
                        (attic (you are in the attic.
                                there is a giant welding torch in the corner.))))
; *nodes*はキーに場所の名前（living-roomなど）を持ち、その場所の風景を描写するテキストをデータに持つ
; このようなデータは連想リスト（association list）、あるいは縮めてalistと呼ばれる
; 風景の描写のデータには文字列を使ってもよいが、文字列は計算にとって根本的なものではないのでより基本的なデータ型であるシンボルを利用している
; オリジナルのデータをシンボルにしておけば出力時に任意のフォーマットに変換しやすいというメリットもある

; 次に場所を描写するコマンドを作る
; リストの中からキーを元に要素を抜き出すassoc関数を使う
; 関数を純粋にするために*nodes*を直接参照するのではなく引数として取る
(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(print (describe-location 'living-room *nodes*))

; 通り道を描写する
; *edges*という変数を作ってキーごとの通り道を持つ
(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

; エッジ名から分かりやすい説明を得る関数
; `から始まるものは準クォート（Quosiquote）と呼ばれ、データの中の一部だけに式を入れたいときに使う
; 準クォートは基本的にはデータモードだが、コンマ（,）からコードモードになって括弧の終了からデータモードに戻るという挙動をする
; コンマが切り替えのマークなのはバッククォートを逆にしたように見えるかららしい
(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(print (describe-path '(living-room west door))) ; (THERE IS A DOOR GOING WEST FROM HERE) 

; 一つの場所からは複数の通り道が出ているのでそれを説明する関数
; (assoc location edges) キー（location）から該当のエッジリストを取得
; (cdr (...)) キーを省いた通り道の情報だけを取得
; (mapcar ...) エッジ情報を説明に変換、mapcarは非常によく使う関数で、1つめに渡した引数の関数を2つめの引数のリストの全ての要素に適用した結果のリストを返す
;   Lispでは関数を値として扱うには#'（functionオペレータの略記）を使う、#'car を展開すると (function car) になる
;   関数と変数の名前を衝突させることが可能（関数と変数で名前空間が別）なのでfunctionオペレータが必要（Schemeは名前空間が同じで重複させられないらしい）
; (apply #'append ...) '((foo) (bar)) となっているデータを '(foo bar) に変換する
;   appendは複数のリストを繋ぎ合わせたリストを返す、つまり (append '(a) '(b) '(c)) -> (a b c) のような挙動をする）が、それぞれの引数にばらばらに一つづつリストを渡す必要がある
;   今回は '((a) (b) (c)) というようなデータのため、そのままappendを適用出来ない
;   そのためapplyを利用している
;   applyは関数とリストを渡すとリストの各要素を関数の引数としてバラして関数を呼び出すような挙動をする
;   (apply #'append '((1) (2) (3))) -> (append '(1) '(2) '(3)) -> '(1 2 3)
(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(print (describe-paths 'living-room *edges*)) ; (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE.)
