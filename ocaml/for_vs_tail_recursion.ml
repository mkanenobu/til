open Core

(* 内部状態を持ち回すのでtail recursionのほうが少し遅い *)
let tail_rec n =
  let rec iter n_ =
    if n_ = 1000
    then ()
    else (
      n := !n + 1;
      iter (n_ + 1))
  in
  iter 0
;;

let () =
  let n = ref 0 in
  let time1 = Unix.gettimeofday () in
  for i = 0 to 1000 do
    n := !n + 1
  done;
  let time2 = Unix.gettimeofday () in
  printf "%.10f\n" (time1 -. time2);
  let n = ref 0 in
  let time1 = Unix.gettimeofday () in
  tail_rec n;
  let time2 = Unix.gettimeofday () in
  printf "%.10f\n" (time1 -. time2)
;;
