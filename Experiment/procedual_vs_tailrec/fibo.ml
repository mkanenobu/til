let procedual n =
  let n1 = ref 0 in
  let n2 = ref 1 in
  let acc = ref 0 in
  if n = 0 then 0
  else
    begin
      for i = 1 to n do
        acc := !n1 + !n2;
        n1 := !n2;
        n2 := !acc;
      done;
      !n1
    end

let tail_recursion n =
  let rec iter i n1 n2 =
    if i <= 0 then n2
    else if i = 1 then n2
    else iter (i - 1) n2 (n1 + n2)
  in
  iter n 0 1
;;

let () =
  Printf.printf "%d\n" (procedual 10);

  Printf.printf "%d\n" (tail_recursion 10);

