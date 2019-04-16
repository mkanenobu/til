open Printf;;

(** write to file **)
let file_write filename: unit =
  let oc = open_out filename in
  fprintf oc "%s\n" "Hello, World!";
  close_out oc
;;


let () =
  file_write "sample.txt"

