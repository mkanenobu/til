(** read_file: string -> int -> string list **)
let read_file filename =
  let ic = open_in filename in
  let n = in_channel_length ic in
  let s = Bytes.create n in
  really_input ic s 0 n;
  close_in ic;
  Bytes.to_string s

let () =
  Printf.printf  "%s" (read_file "hello.ml")
