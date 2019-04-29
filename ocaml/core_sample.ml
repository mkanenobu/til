open Core

let () =
  let stripped = String.strip " string   " in
  Printf.printf "%s\n" stripped;
