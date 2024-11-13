; 4 条件と判断

; 空のリストは偽値として評価される
(print (if '() 
  'i-am-true
  'i-am-false))

(print (if '(1) 
  'i-am-true
  'i-am-false))

; リストの長さを返す関数
; 再帰的に渡したリストを一つづつ減らしながらカウントをインクリメントしていく
(defun my-length (list)
  (if list
   (1+ (my-length (cdr list)))
   0))
(print (my-length '(1 2 3)))

; 空のリストはfalseとして評価されるが、それだけではなくCommon Lispにおいて空のリストが唯一の偽値である
; 空のリスト以外は全て真の値として扱われる
; ただ空のリストの書き方はいくつかある
; '(), (), 'nil, nil
; 比較するとどれも同じ
(print (eq '() nil))
(print (eq '() ()))
(print (eq '() 'nil))
; データとして有効なのは '() と 'nil だけに見えるが、nil は定数で、() は nil と同値として扱うように仕様で決まっている
; Schemaなど空リストと偽値が別ものとして扱われる方言もある

; ifは真と偽で挙動を変えたいときに使う
; 空リストが偽として評価されるため空リストの判定にも使える
(print (if (= (+ 1 2) 3)
  'yup
  'nope))

; 関数の後に続く式は関数が呼ばれる前に評価されるが、ifはその挙動をせず結果のアームの式しか評価されない
; こういった挙動をするのはifが通常の関数ではなく特殊形式（Special Forms）であるため
; Lispにおける条件分岐コマンドは大抵の場合特殊形式になっている
(if '()
  ; ゼロ除算しているのでこの式が評価されるとエラーになるが評価されないのでエラーにならない
  (/ 1 0)
  'false)

; ifのアーム内では一つの式しか評価出来ないが、prognという特別なコマンドを使うことで複数の式を評価出来る
; prognは複数の式をまとめて最後の式の評価値をフォーム全体の評価値として返す
(defvar *number-was-odd* nil)
(print (if (oddp 5)
           ; 真の場合変数に代入しながら 'odd-numberを返す
           (progn (setf *number-was-odd* t)
                  'odd-number)
           'even-number))
(print *number-was-odd*)

; わざわざprognを書かなくても良いコマンドも用意されている（これを暗黙のprognという）
; whenやunlessがその一つ
; whenは条件が真のときに囲まれた式を全て実行し、unlessは偽のときに式を実行する
; 条件が逆の場合に実行する式を指定することは出来ず、その場合にはこれらのフォームは何もせずnilを返す
(defvar *number-is-odd* nil)
(when (oddp 5)
  (setf *number-is-odd* t)
  'odd-number)
(unless (oddp 4)
  (setf *number-is-odd* nil)
  'even-number)

; 全ていい感じにするにはcondを使うことが出来る
; condはLispにとって最も古い条件分岐の形式で、括弧を多く使うかわりに暗黙のprognが使えて複数の分岐も書ける
(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  ; condの条件は常に上から検査され最初に条件を満たしたものに入る
  ; 最後のt（真）は他の条件を満たさなかったときのための保証でcondでは一般的なイディオム
  (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                            '(curse you lisp alien - you ate my pudding))
        ((eq person 'johny) (setf *arch-enemy* 'useless-old-johny)
                           '(i hope you choked on my pudding johny))
        (t '(why you eat my pudding stranger ?))))

(print (pudding-eater 'henry))(print *arch-enemy*)
(print (pudding-eater 'johny))(print *arch-enemy*)
(print (pudding-eater 'george-clooney))

; case
; caseは自分で比較する必要がなく値を並べておくだけでいい（eqで比較される）
(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  (case person
    ((henry) (setf *arch-enemy* 'stupid-lisp-alien)
            '(curse you lisp alien - you ate my pudding))
    ((johny) (setf *arch-enemy* 'useless-old-johny)
            '(i hope you choked on my pudding johny))
    (otherwise '(why you eat my pudding stranger ?))))

(print (pudding-eater 'henry))(print *arch-enemy*)
(print (pudding-eater 'johny))(print *arch-enemy*)
(print (pudding-eater 'george-clooney))

; and/or
(print (and t t t))
(print (and t t nil))
(print (or nil nil t))
(print (or nil nil nil))

; and/orは短絡評価されるので条件判断にも使える
(defparameter *it-is-even* nil)
; (oddp 4) はnilになるので *it-is-even* への代入が評価される
(or (oddp 4) (setf *it-is-even* t))
(print *it-is-even*)
(setf *it-is-even* nil)
; (oddp 5) はtになるので *it-is-even* への代入が評価されず値が変わらない
(or (oddp 5) (setf *it-is-even* t))
(print *it-is-even*)

; これはaがtの場合はbを実行、bが成功したらcを実行というような処理を↓のように書けたりする
; (and a (b) (c))

; Lispはnilと同値以外のもの以外は全て真として扱われるため、条件判断に使われるような関数であっても真偽値以上のものを返すことが出来る
; memberはリスト中に任意の要素が含まれるかどうかを調べる関数
; ↓普通の使い方
(print (if (member 1 '(3 4 1 5))
    'one-is-in-the-list
    .one-is-not-in-the-list))
; memberだけを実行してみると要素が含まれる場合も真の値だけを返しているわけでは無いことが分かる
; nil以外はtruthyで、条件分岐に使う分には余分な情報を返しても挙動が変わらないので、真偽値よりなるべく詳しい情報を返す慣習がある
; memberに関していうと最初に見つけた要素以降の部分リストを返す
(print (member 1 '(3 4 1 5))) ; (1 5)

; memberがなぜ見つけた要素のみを返さないかというと、一つの特殊な例において問題があるから
; 次のコードはnilが含まれるかどうかを検査するもので問題なく動くが、この例において見つかった要素（nil）だけを返すとnilが返る=要素が見つからなかったという意味になってしまうため
; 見つかった要素以降の部分リストを返せば必ず1以上の長さを持つリストになるため真の値として評価される値を返せる
(print (if (member nil '(3 4 nil 5))
    'nil-is-in-the-list
    'nil-is-not-in-the-list))

; より多くの情報を返すことで便利になっている例としてfind-ifがある
; find-ifは1つめの引数に関数を取って2つめのの引数のリストにその関数を適用していき結果が真になる最初の要素を返す（#は高階関数に関わるものだが後の章で説明があるので今は気にしなくていい）
; その結果として、find-ifは特定の条件を満たす要素を取り出す役割と、条件分岐の中で真偽値を返す関数としての役割の2つをこなせる
(print (find-if #'oddp '(2 4 5 6)))
(print (if (find-if #'oddp '(2 4 5 6))
        'there-is-an-odd-number
        'there-is-no-odd-number))
; ただfind-ifは、memberの例のような条件を満たす要素がnilだった場合に偽値として判定されてしまう、という問題を解決していない
