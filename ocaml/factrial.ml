(* standard recursion *)
let rec fact1 n =
  if n <= 0 then
    1
  else
    fact1 (n - 1) * n
;;

(* tail call *)
(* acc は一時的な計算結果を持つ値 *)
let fact2 n =
  let rec iter i acc =
    if i <= 1 then
      acc
    else
      iter (i - 1) (acc * i)
  in
  iter n 1
;;

let () =
  (* let arg1 = int_of_string Sys.argv.(1) in *)
  let arg1 = 5 in
  Printf.printf "%d\n" (fact1 arg1);
  Printf.printf "%d\n" (fact2 arg1);
