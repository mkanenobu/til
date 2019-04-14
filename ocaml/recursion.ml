(* 再帰的に使用する関数であることを明示する必要がある *)
let rec range a b =
  if a > b then []
  else a :: range (a + 1) b;;

(* tail call *)
let factorial n =
  let rec iter i n' =
    if i <= 1 then n'
    else iter (i - 1) (n' * i)
  in
  iter n 1
;;


let () =
  List.iter (fun n -> Printf.printf "%d\n" n) (range 2 12);
  Printf.printf "factorial of 5: %d\n" (factorial 5)
