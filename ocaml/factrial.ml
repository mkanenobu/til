(* standard recursion *)
let rec fact1 n = if n <= 0 then 1 else fact1 (n - 1) * n

(* tail call *)
(* acc は一時的な計算結果を持つ値 *)
let fact2 n =
  let rec iter i acc = if i <= 1 then acc else iter (i - 1) (acc * i) in
  iter n 1
;;

let () =
  let n = ref 0 in
  (try n := int_of_string Sys.argv.(1) with
  | _ ->
    Printf.printf "Require 1 argument\n";
    ignore @@ exit 1);
  Printf.printf "%d\n" (fact1 !n)
;;
