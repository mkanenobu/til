let rec fibo n =
  if n = 0 then 0
  else if n = 1 then 1
  else (fibo (n - 1)) + (fibo (n - 2))
;;

let rec fibo_pair n =
  if n = 1 then (1, 0)
  else
    let (i, j) = fibo_pair (n - 1) in
    (i + j, i)
;;

let fibo_pair_ n =
  let (n, _) = fibo_pair n in
  n
;;

let fibo_tail n =
  let rec iter i (n1, n2) =
    if i = 1 then n2
    else iter (i - 1) (n2, (n1 + n2))
  in
  iter n (0, 1)
;;

let () =
  for i = 1 to 100 do
    Printf.printf "% d\n" (match fibo_tail i with
        | n when n < 0 -> Printf.printf "overflow"; exit 1;
        | n -> n);
  done

