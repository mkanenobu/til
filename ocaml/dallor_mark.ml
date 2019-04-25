let ($) f x =
  f (x)
;;

let add_one n =
  n + 1
;;

let () =
  Printf.printf "%d\n" (add_one $ add_one 3)

