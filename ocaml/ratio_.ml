open Printf

let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
;;

let parse_arg arg =
  try int_of_string arg
  with _ -> exit 2
;;

let () =
  let args = Sys.argv in
  if Array.length args <> 3 then exit 1;
  let arg1 = parse_arg args.(1) in
  let arg2 = parse_arg args.(2) in
  let divisor = gcd arg1 arg2 in
  printf "%.1f x %.1f\n" (float @@ arg1 / divisor) (float @@ arg2 / divisor)
