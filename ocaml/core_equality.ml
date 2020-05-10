open Core

type int1 = Int1 of int
type int2 = Int2 of int

let state = `On

(* same value, but has different type *)
let n = 10
let n1 = Int1 10
let n2 = Int2 10

let () =
  (* phys_equal: 'a -> 'a -> bool *)
  assert (phys_equal n 10);
  (* phys_same: 'a -> 'b -> bool *)
  assert (phys_same n1 n2)
;;
