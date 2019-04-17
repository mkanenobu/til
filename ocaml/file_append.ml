open Printf

let file_append filename word =
  let oc = open_out_gen [Open_append; Open_creat] 0o666 filename in
  fprintf oc "%s" word;
  close_out_noerr oc
;;

let () =
  file_append "sample.txt" "aaaaaaaa"
