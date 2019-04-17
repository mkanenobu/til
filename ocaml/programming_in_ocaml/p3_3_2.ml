(* 3.1 *)
let dollar_to_yen us_dollar =
  int_of_float (us_dollar *. 114.32)

let yen_to_dollar yen =
  let round f = floor (f +. 0.5) in
  round (float yen /. 114.32 *. 100.0) /. 100.0

let print_dollar_to_yen dollar =
  Printf.printf "%F dollars are %d yes\n" dollar (dollar_to_yen dollar)

let capatalize (c : char) =
  Char.uppercase_ascii c

(* 3.2 *)
(* same as b1 && b2 *)
let as_and b1 b2 =
  if b1 = true then b2 else false

(* same as b1 || b2 *)
let as_or b1 b2 =
  if b1 = true then true else b2

(* 3.3 *)
let as_and2 b1 b2 =
  not ((not b1) || not b2)

let as_or2 b1 b2 =
  not ((not b1) && not b2)

let () =
  (* 3.1 *)
  Printf.printf "%d\n" (dollar_to_yen 10.0);
  Printf.printf "%F\n" (yen_to_dollar 100);
  print_dollar_to_yen 100.10;
  print_dollar_to_yen 0.10;
  Printf.printf "%c\n" (capatalize 'a');
  Printf.printf "%c\n" (capatalize '1');

  (* 3.2 *)
  Printf.printf "%B\n" (as_and true true); (* true *)
  Printf.printf "%B\n" (as_and true false); (* false *)
  Printf.printf "%B\n" (as_and false false); (* false *)

  Printf.printf "%B\n" (as_or true true); (* true *)
  Printf.printf "%B\n" (as_or true false); (* true *)
  Printf.printf "%B\n" (as_or false false); (* false *)

  (* 3.3 *)
  Printf.printf "%B\n" (as_and2 true true); (* true *)
  Printf.printf "%B\n" (as_and2 true false); (* false *)
  Printf.printf "%B\n" (as_and2 false false); (* false *)

  Printf.printf "%B\n" (as_or2 true true); (* true *)
  Printf.printf "%B\n" (as_or2 true false); (* true *)
  Printf.printf "%B\n" (as_or2 false false); (* false *)
