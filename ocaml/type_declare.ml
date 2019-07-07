(* other name *)
type integer = int
type pair_of_ints = int * int
(* optional type *)
type pair_of_ints_op = None | Some of pair_of_ints
type my_tuple = string * string

(* variant type *)
(* それぞれがコンストラクタ、これらによって初期化された値が型`foo`を持つ *)
type foo =
  | Nothing
  | Int of int
  | Pair of int * int
  | String of string

let () =
  let n: integer = 10 in
  let _pair: pair_of_ints_op = Some (3, 5) in
  (* _string typed `foo` *)
  let _string = String "string foo" in

  (* inherit super class *)
  Printf.printf "%d\n" n;

  let (tup_one, tup_two): my_tuple = ("string1", "string2") in
  Printf.printf "%s\n" tup_one;
  Printf.printf "%s\n" tup_two;

