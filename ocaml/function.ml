let average a b = (a +. b) /. 2.0

(* 明示的な型宣言 *)
let average_t (a : float) (b : float) = (a +. b) /. 2.0

(* 無名関数 *)
let lambda_add a b = a + b

(* 中置演算子の定義 *)
(* like Haskell's `$` *)
let ( $ ) f x = f x

(* 明示的な型宣言 *)
let lambda_triplet (x : int) = x * 3

(* ラベル付き引数 *)
let labeled_argument x ~func = func x

let optional_argument ?x y =
  (match x with
  | Some n -> n
  | None -> 0)
  + y
;;

(* オプショナル引数(デフォルト値付き) *)
let optional_argument_with_default ?(y = 0) x = x + y

(* 最後の引数をオプショナル引数にするとwarningが出るので
   すべての引数がオプショナル引数の場合、最後の引数をunitにする
*)
let optional_argument_with_default2 ?(x = 0) () = x

let string_repeat n s =
  let rec iter n' acc =
    match n' with
    | 0 -> acc
    | _ -> iter (n' - 1) (acc ^ s)
  in
  iter n ""
;;

let () =
  Printf.printf "%s\n" (string_repeat 3 "abc");
  Printf.printf "%F\n" (average 3.1 1.5);
  Printf.printf "%F\n" (average_t 3.1 1.5);
  Printf.printf "%d\n" (lambda_add 3 4);
  Printf.printf "%d\n" (lambda_triplet 3);
  Printf.printf "%s\n" $ string_repeat 3 "aaa";
  Printf.printf "%d\n" @@ labeled_argument 3 ~func:lambda_triplet;
  Printf.printf "%d\n" @@ optional_argument 3 ?x:(Some 100);
  Printf.printf "%d\n" @@ optional_argument_with_default 3;
  Printf.printf "%d\n" @@ optional_argument_with_default 3 ?y:(Some 4);
  (* この引数指定はデフォルト値が存在する場合のみ可能 *)
  Printf.printf "%d\n" @@ optional_argument_with_default 3 ~y:4;
  Printf.printf "%d\n" @@ optional_argument_with_default2 ();
  Printf.printf "%d\n" @@ optional_argument_with_default2 ~x:100 ()
;;
