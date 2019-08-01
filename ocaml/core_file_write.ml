open Core

(** write to file **)
let file_write filename str =
  let oc = Out_channel.create filename in
  protect ~f:(fun () -> fprintf oc "%s\n" str)
    ~finally:(fun () -> Out_channel.close oc)

let file_append filename str =
  let oc = Out_channel.create ~append:true filename in
  protect ~f:(fun () -> fprintf oc "%s\n" str)
    ~finally:(fun () -> Out_channel.close oc)

let () =
  file_write "sample.txt" "Hello, World!";
  file_append "sample.txt" "Hello, OCaml!";
