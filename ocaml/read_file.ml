(** read_file_all: string -> string **)
let read_file_all filename: string =
  let ic = open_in filename in
  let n = in_channel_length ic in
  let s = Bytes.create n in
  really_input ic s 0 n;
  close_in ic;
  Bytes.to_string s
;;

(** read_file_lines: string -> string list **)
let read_file_lines filename: string list =
  let ic = open_in filename in
  let try_read () =
    try Some (input_line ic)
    with End_of_file -> None in
  let rec iter acc =
    match try_read () with
    | Some s -> iter (s :: acc)
    | None -> close_in_noerr ic;
      List.rev acc in
  iter []
;;

let () =
  Printf.printf "%s\n" "Returns string";
  Printf.printf  "%s\n" (read_file_all "hello.ml");

  Printf.printf "%s\n" "Returns string list";
  List.iter (fun e -> Printf.printf "%s\n" e) (read_file_lines "hello.ml")
