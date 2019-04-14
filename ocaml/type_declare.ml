(* other name *)
type integer = int

type pair_of_ints = None | Some of pair_of_ints

let () =
  let n: integer = 10 in
  (* same instance *)
  Printf.printf "%d" n
