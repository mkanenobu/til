open Core
(* include local module *)
open Person

let () =
  let john = new person in
  print_endline @@ john#get_fullname
