(* 再帰的に使用する関数であることを明示する必要がある *)
let rec range a b =
  if a > b then []
  else a :: range (a + 1) b;;

Printf.printf "%d" ::(range 2 10)
