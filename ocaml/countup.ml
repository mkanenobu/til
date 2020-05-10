open Core

let countup n m =
  let rec iter n_ =
    if n_ > m
    then ()
    else (
      printf "%d\n" n_;
      iter (n_ + 1))
  in
  iter n
;;

let () = countup 10 20
