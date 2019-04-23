let average a b =
  (a +. b) /. 2.0
;;

(* 明示的な型宣言 *)
let average_t (a: float) (b: float) =
  (a +. b) /. 2.0
;;

(* 無名関数 *)
let lambda =
  fun x -> x * 3
;;

(* 中置演算子の定義 *)
(* like Haskell's `$` *)
let ($) f x =
  f (x)
;;

(* 明示的な型宣言 *)
let lambda_t =
  fun (x: int) -> x * 3
;;

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
  Printf.printf "%d\n" (lambda 3);
  Printf.printf "%d\n" (lambda_t 3);
  Printf.printf "%s\n" $ string_repeat 3 "aaa";
