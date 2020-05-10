open Core

let read_file filename =
  let ic = In_channel.create filename in
  In_channel.input_all ic
;;

let read_lines filename =
  let ic = In_channel.create filename in
  let rec read_while_eol acc =
    match In_channel.input_line ic with
    | Some line -> read_while_eol (line :: acc)
    | None -> acc
  in
  read_while_eol []
;;

let () =
  print_endline "input_line";
  let lines = read_lines "sample.txt" in
  List.iteri lines ~f:(fun i line -> printf "line %d: %s\n" i line);
  print_endline "input_all";
  let all_of_file = read_file "sample.txt" in
  print_string all_of_file;
  print_endline "iter_lines";
  let ic = In_channel.create "sample.txt" in
  In_channel.iter_lines ic ~f:(fun line -> print_endline line);
  print_endline "read_lines";
  let lines_list = In_channel.read_lines "sample.txt" in
  List.iter lines_list ~f:(fun line -> printf "%s\n" line)
;;
