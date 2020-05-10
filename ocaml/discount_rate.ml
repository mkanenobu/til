open Core

let discount_rate listed discount =
  int_of_float
  @@ Float.round_nearest
  @@ (((1.0 -. (float discount /. float listed)) *. 100.0) +. 0.5)
;;

let () = Printf.printf "%d\n" @@ discount_rate 189000 49800
