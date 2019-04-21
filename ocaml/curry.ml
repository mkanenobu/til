(** concat1: string * string -> string **)
let concat1 (s1, s2) =
  s1 ^ s2 ^ s1
;;

(* currying *)
(** concat2: string -> string -> string **)
let concat2 s1 =
  fun s2 -> s1 ^ s2 ^ s1
;;

(* 部分適用の例 *)
(* fun s2 -> "__" ^ s2 ^ "__" *)
let emphasize =
  concat2 "__"
;;

let f1 =
  fun x y -> x + y
;;
(* same *)
let f2 x y =
  x + y
;;

let () =
  print_endline (concat1 ("Hello, ", "World!"));
  print_endline ((concat2 "Hello, ") "World!");
  print_endline (emphasize "ALERT");

  (* `-` は中置演算子としても符号反転の前置演算子としても使用可能なので
     下記はabs (-)(3)と理解されてしまう。このような場合は前置演算子、`~-`を使用する。 *)
  (* Printf.printf "%d\n" (abs -3) This is error *)
  Printf.printf "%d\n" (abs ~-3); (* work well *)
