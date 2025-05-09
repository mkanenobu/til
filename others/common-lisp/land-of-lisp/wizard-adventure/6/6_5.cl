; 6.5 readとevalの危険性について

; REPLを作るにあたってreadとevalを使ったがこれらのコマンドは非常にパワフルであると同時に非常に危険でもある
; 注意して使わなければ悪意あるコマンドを実行出来てしまう

; 例えばプログラムのなかで format-harddrive という関数を定義していたとする
; この関数は誰でも呼び出せて良い訳ではなく、ゲームのREPLからこのコマンドを呼び出されると大変なことになる

; 今回のゲームのインターフェースではあらかじめリストに載っているコマンドしか実行を許さない game-eval 関数を定義することでそのような問題を防いでいる

; しかしプレイヤーはより高度な攻撃を試みるかもしれない
; このプログラムには攻撃を許す脆弱性が一つある
; それはリーダーマクロと言われるもので、readコマンドに備わった高度な機能である
; 一応リーダーマクロは変数*read-eval*をnilに設定することで無効化出来る

; 問題のあるコードを実行出来てしまう一例
; walk #.(format-harddrive)

(defun format-harddrive ()
  "This is danger command")

(print (read-from-string "#.(format-harddrive)"))

(setf *read-eval* nil)
; リーダーマクロを無効化するとリーダーマクロが無いと解釈出来ない入力をした場合にはエラーになる
(print (read-from-string "#.(format-harddrive)"))

; 原則としてreadやevalを使うプログラムを完全に安全にするのは難しいので、
; プロダクションコードを書く場合にはこれらのコマンドは可能な限り避ける方がよい
