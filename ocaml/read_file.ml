(** read_file: string -> int -> string list **)
let read_file filename =
  let ic = open_in filename in
  let n = in_channel_length ic in
  let s = Bytes.create n in
  really_input ic s 0 n;
  close_in ic;
  s

let () =
  Printf.printf  "%s" (Bytes.to_string (read_file "hello.ml"))
