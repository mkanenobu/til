let print_two_ints x y =
  Printf.printf "%d, %d\n" x y
;;

let print_two_floats x y =
  Printf.printf "%F, %F\n" x y
;;

(* 中置演算子の定義 *)
let (+=) a b =
  a := !a + b

let () =
  (* `~-`は前置演算子としてしか機能しない`-` *)
  (* `10`, `-1`と解釈される *)
  print_two_ints 10 ~-1;
  (* `10`, `-`, `1`と解釈されエラー *)
  (* print_two_ints 10 -1; *)

  (* float版 *)
  print_two_floats 3.5 ~-.12.4;
  (* `3.5`, `-`, `12.4`と解釈されエラー *)
  (* print_two_floats 3.5 -12.4; *)

  let n = ref 0 in
  Printf.printf "%d\n" !n;
  n += 10;
  Printf.printf "%d\n" !n;

