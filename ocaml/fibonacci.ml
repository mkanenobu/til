open Core

let rec fibo n =
  if n <= 1 then n
  else if n = 1 then 1
  else (fibo (n - 1)) + (fibo (n - 2))
;;

let fibo_tail n =
  let rec iter i (n1, n2) =
    if i <= 1 then n2
    else iter (i - 1) (n2, (n1 + n2))
  in
  iter n (0, 1)
;;

let () =
  let args = Sys.get_argv () in
  let num = int_of_string args.(1) in
  printf "%d\n" @@ fibo_tail num
