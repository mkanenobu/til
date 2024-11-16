; 5
; 5.1 魔法使いのアドベンチャー

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

; (print (describe-location 'living-room *nodes*))

; 5.2 通り道を描写する
; *edges*という変数を作ってキーごとの通り道を持つ
(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

; エッジ名から分かりやすい説明を得る関数
; `から始まるものは準クォート（Quosiquote）と呼ばれ、データの中の一部だけに式を入れたいときに使う
; 準クォートは基本的にはデータモードだが、コンマ（,）からコードモードになって括弧の終了からデータモードに戻るという挙動をする
; コンマが切り替えのマークなのはバッククォートを逆にしたように見えるかららしい
; この例では関数呼び出しだが変数を直接入れることも出来る `(this is ,*variable* data)
(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

; (print (describe-path '(living-room west door))) ; (THERE IS A DOOR GOING WEST FROM HERE) 

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

; (print (describe-paths 'living-room *edges*)) ; (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE.)

; 5.3 特定の場所にあるオブジェクトを描写する

; まずゲーム世界に存在するオブジェクトのリストを作る
(defparameter *objects* '(whisky bucket frog chain))
; 次にオブジェクトの場所を管理する変数を作り、オブジェクトとその場所をalistで表現する
(defparameter *object-locations* '((whisky living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden)))
                                
; 与えられた場所から見えるオブジェクトを返す関数
(defun objects-at (loc objs obj-locs)
  ; ローカル関数at-loc-pを定義
  ; at-loc-pはオブジェクトの名前を取って、locにそれがあるかどうかをt or nilで返す
  ; Common Lispでは真偽値を返す関数には名前の最後にpを付ける慣習がある（predicateのp）
  (labels ((at-loc-p (obj)
             ; オブジェクトのある場所を (assoc obj obj-locs) で取得し、その場所がlocと一致するかどうかを調べる
             (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

; (print (objects-at 'living-room *objects* *object-locations*))

; ある場所で見えるオブジェクトを描写する関数
(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
            `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

; 5.4 全てを描写する
; これまで定義してきた関数をlookというコマンドでまとめて呼び出せるようにする
; lookはプレイヤーがプレイ中に実際にタイプして周りを見渡すコマンドなので、プレイヤーの現在の場所を知っておく必要がある（関数型スタイルの純粋な関数ではない）
; ここでは現在地を保持する変数を作る
(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))

; (print (look))

; 5.5 ゲーム世界を動き回る

; walkは方向を引数に取ってそちらへ移動する関数
; まずこの関数は現在地から進むことが出来る通り道を*edges*から取得する
; 指定した通り道があれば、通り道の先の場所に移動し、lookを呼び出す
(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    ; :key はキーワード引数という構文、:キーワード [引数の値] という形で他の言語にもよくあるやつ
                    :key #'cadr)))
    (if next
      (progn (setf *location* (car next))
             (look))
      '(you cannot go that way.))))

; (print (walk 'west))

; 5.6 オブジェクトを手に取る
(defun pickup (object)
  ; memberでオブジェクトが現在地にあるかどうかを調べる
  (cond ((member object (objects-at *location* *objects* *object-locations*))
          ; 存在していればオブジェクトと新しい場所（'body=プレーヤーの体）の組み合わせを*object-locations*に追加し、メッセージを返す
          ; pushは変数の先頭に要素を追加する

          ; 新しい場所を追加するのと同時に前の場所を削除する必要があるように思うが、objects-atコマンドの中で使っているassocコマンドは、
          ; 最初に見つかった要素（以降）を返すので前の場所を消す必要はなく、新しい場所を追加するだけ更新されたように見える
          ; このpush/assocを使ってalistを更新しているように見せるのはよく使うイディオム
          (push (list object 'body) *object-locations*)
          `(you are now carring the ,object))
        ; 存在していなければ出来ないというメッセージを返す
        (t '(you cannot get that.))))

; (print (pickup 'whisky))

; 5.7 持っているものを調べる

; プレイヤーが現在持っているものを調べる関数を作る
(defun inventory ()
  ; この 'items- はそれっぽいコマンドに見えるが「アイテム:」のようなただのラベルのデータ
  (cons 'items- (objects-at 'body *objects* *object-locations*)))

; (print (inventory))

; これでlookコマンドで見回す、walkコマンドで移動、pickupコマンドでオブジェクトを拾う、inventoryコマンドで今持っているものを確認する、
; というテキストアドベンチャーゲームの基本的なエンジンができた
