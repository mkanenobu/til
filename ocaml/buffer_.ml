open Core

let () =
  let buf = Buffer.create 0 in
  let args = List.sub (Array.to_list Sys.argv) ~pos:1 ~len:(Array.length Sys.argv - 1) in
  List.iter args ~f:(fun e -> Buffer.add_string buf e);
  print_endline @@ Buffer.contents buf
;;
