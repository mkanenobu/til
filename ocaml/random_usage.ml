open Core

let random_int (n, m) x =
  let rec iter l n' = if n' <= 0 then l else iter (Random.int_incl n m :: l) (n' - 1) in
  iter [] x
;;

let () =
  Random.self_init ();
  let l = random_int (5, 10) 10 in
  List.iter l ~f:(fun e -> printf "%d\n" e)
;;
