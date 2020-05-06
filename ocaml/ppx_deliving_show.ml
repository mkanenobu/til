open Core
(* compile with `-pkg ppx_deliving.show` option *)

type two_ints = int * int
[@@deriving show]

type obj = {
  key: string
} [@@deriving show]

let () =
  let two_ints_ = (3, 12) in
  print_endline @@ show_two_ints two_ints_;
  print_endline @@ show_obj {key = "hogehoge"};

