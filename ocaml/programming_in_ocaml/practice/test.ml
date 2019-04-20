let f (x, n) =
  x ** ((2.0 *. float n) +. 1.0)
;;

let f2 (x, n) =
  (x ** 2.5) ** float n
;;

let () =
  Printf.printf "%F\n" (f (2.0, 2));
  Printf.printf "%F\n" (f2 (2.0, 2))
