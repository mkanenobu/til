let rec loop i =
  Printf.printf "%d\n" i;
  if i <= 4 then loop (i + 1)
;;

let countUp i =
  let rec iter n =
    Printf.printf "%d\n" n;
    if n >= i then i else iter (n + 1)
    (* expression *)
  in
  iter 0
;;

;;
Printf.printf "Countup\n";
(* 'ignore' is ignore 'this expression should have type unit' warning *)
ignore (countUp 10);
Printf.printf "Loop other\n";
loop 3;
Printf.printf "Loop starts 0\n";
loop 0;
Printf.printf "Loop starts 3\n";
loop 3
