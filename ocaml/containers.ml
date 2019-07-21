
(* List: 変更されない単方向のリスト
   要素を加えると常に、要素xとリストtlからなる新しいリストが生成される。 tl は変更されないしコピーもされない。

   要素を「追加」 : O(1), cons 演算(::)
   長さ : O(n), 関数 List.length
   i番目の要素のアクセス: O(i)
   要素の探索 : O(n)

   向いている用途: IO、パターン・マッチング
   向いていない用途: ランダムアクセス、索引付き要素
*)
let list' = [1; 2; 3]

(* Array, String: 変更可能なベクトル
   配列と文字列は非常に似ている。 文字列は文字の並び(バイト列)の格納に特化しており、 便利な構文を備えコンパクトに格納出来る。

   要素を「追加」: O(n)
   長さ: O(1), 関数 Array.length
   i番目の要素のアクセス: O(1)
   要素の探索: O(n)

   最適な用途: 
   サイズが既知である要素集合であり、数値インデックスでアクセスし、その場変更するようなもの。 
   基本的な配列や文字列は固定長である。 伸縮する文字列には標準 Buffer 型(後述)が使える。
*)
let array' = [|1; 2; 3|]
let string' = "string"

(* Set, Map:　変更されないツリー
   リストと同様、これらも変更されず、また部分木を共有するかもしれない。

   要素を「追加」: O(log n)
   要素の数を返す: O(n)
   要素の探索 : O(log n)
   Set と Map は編集とメタプログラミングに特に有用であるが、
   他の場合はハッシュテーブルのほうがたいてい適切。
*)
module String_set = Set.Make (String)
let s1 = String_set.singleton "string"

(* Hashtbl: 伸縮性のあるハッシュ表
   OCaml のハッシュ表は変更可能なデータ構造であり、
   (キー、データ)の組を一箇所に格納するのに向いている。

   要素の追加: O(1) - テーブルの初期サイズが含まれる要素の数よりも大きい場合; O(log n) - 初期値が n よりも小さい表に追加する場合の平均
   要素の数を返す: O(1)
   要素の探索 : O(1)
*)
let hashtbl' = Hashtbl.create 10;;
Hashtbl.add hashtbl' 1 "One";;

(* Buffer: 伸縮性のある文字列
   バッファは一箇所にバイト列を蓄積する効率的な方法を提供する。 これらは変更可能である。

   文字を追加: O(1) - バッファが十分に大きい場合; O(log n) - バッファの初期サイズがバイト数 n よりも小さい場合の平均。
   k 文字分の文字列を追加: O(k * 「文字を追加」)
   長さ: O(1)
   要素iのアクセス: O(1)
*)
let buffer' = Buffer.create 5;;
Buffer.add_string buffer' "hello";;
assert ("hello" = Buffer.contents buffer');;

(* Queue: キュー
   OCaml のキューは変更可能な先入れ先出し (FIFO) データ構造である。

   要素の追加: O(1)
   要素の取り出し: O(1)
   長さ: O(1)
*)
let queue' = Queue.create ();;
Queue.add 1 queue';;
Queue.add 2 queue';;
assert ((Queue.pop queue') = 1);;

(* Stack: スタック
   OCaml のスタックは変更可能な後入れ先出し (LIFO) データ構造である。
   変更可能であることを除けばリストとちょうど同じである。
   すなわち、要素の追加は新しいスタックを生成するのではなく、 スタックに単に追加する。

   要素の追加: O(1)
   要素の取り出し: O(1)
   長さ: O(n)
*)
let stack' = Stack.create ();;
Stack.push 1 stack';;
Stack.push 2 stack';;
assert ((Stack.pop stack') = 2);;

