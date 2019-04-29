let f1 a ~second:b =
  a - b
;;

let f2 ~first ~second =
  first - second
;;

let () =
  Printf.printf "%d\n" (f1 10 ~second:1);
  (* same *)
  Printf.printf "%d\n" (f1 ~second:1 10);

  Printf.printf "%d\n" (f2 ~second:1 ~first:10);
