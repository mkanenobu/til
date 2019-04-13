let rec fibo n =
  if n = 0 then 0
  else if n = 1 then 1
  else (fibo (n - 1)) + (fibo (n - 2))
;;

let fibo_tail n =
  let rec iter i n1 n2 =
    if i <= 0 then n2
    else if i = 1 then n2
    else iter (i - 1) n2 (n1 + n2)
  in
  iter n 0 1
;;

let () =
  for i = 0 to 60 do
    Printf.printf "%d\n" (fibo_tail i);
  done
