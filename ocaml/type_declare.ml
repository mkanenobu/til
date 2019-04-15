(* other name *)
type integer = int
type pair_of_ints = None | Some of pair_of_ints
type my_tuple = string * string

let () =
  let n: integer = 10 in
  (* same instance *)
  Printf.printf "%d\n" n;

  let (tup_one, tup_two) = ("string1", "string2") in
  Printf.printf "%s\n" tup_one;
  Printf.printf "%s\n" tup_two;

