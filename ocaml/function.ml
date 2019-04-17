let average a b =
  (a +. b) /. 2.0
;;

(* 明示的な型宣言 *)
let average_t (a: float) (b: float) =
  (a +. b) /. 2.0
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
  Printf.printf "%F\n" (average 3.1 1.5);
  Printf.printf "%s\n" (string_repeat 3 "abc")
