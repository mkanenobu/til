let pow1 (x, n) =
  let rec iter (x', n')=
    if n' = 0 then 1.0
    else
    if n' = 1 then x'
    else iter (x' *. x, (n' - 1))
  in
  iter (x, n)
;;

let pow2 (x, n) =
  0.0
;;

let () =
  Printf.printf "%F\n" (pow1 (4.0, 2));
