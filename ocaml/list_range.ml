open Core

let l = List.range 5 10

let (--) start_ end_ = List.range start_ end_

let l2 = 100 -- 110

let () =
  List.iter l ~f:(fun e -> printf "%d\n" e);
  List.iter l2 ~f:(fun e -> printf "%d\n" e);
