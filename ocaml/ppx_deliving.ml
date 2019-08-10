open Core
(* compile with `-pkg ppx_deliving.show` option *)

type two_ints = int * int
[@@deriving show]

(* pp_two_intsとshow_two_intsが生成される *)

let () =
  let two_ints_ = (3, 12) in
  printf "%s\n" @@ show_two_ints two_ints_
