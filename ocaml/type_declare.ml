(* other name *)
type integer = int
type pair_of_ints = int * int

(* optional type *)
type pair_of_ints_op =
  | None
  | Some of pair_of_ints

type my_tuple = string * string

(* variant type *)
(* それぞれがコンストラクタ、これらによって初期化された値が型`foo`を持つ *)
(* enum *)
type foo =
  | Type1
  | Type2
  | Type3

type bar =
  | Nothing
  | Int of int
  | Pair of int * int
  | String of string
  | Object of
      { key : int
      ; value : string
      }

let () =
  let n : integer = 10 in
  let _pair : pair_of_ints_op = Some (3, 5) in
  let _type1 : foo = Type1 in
  (* _string typed `bar` *)
  let _string : bar = String "string foo" in
  let _object : bar = Object { key = 0; value = "first element" } in
  (* inherit super class *)
  Printf.printf "%d\n" n;
  let (tup_one, tup_two) : my_tuple = "string1", "string2" in
  Printf.printf "%s\n" tup_one;
  Printf.printf "%s\n" tup_two
;;
