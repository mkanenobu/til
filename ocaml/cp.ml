let file_read filename: string list =
  let ic = open_in filename in
  let try_read () =
    try Some (input_line ic)
    with End_of_file -> None in
  let rec iter acc =
    match try_read () with
    | Some s -> iter (s::acc)
    | None -> close_in_noerr ic;
      List.rev acc in
  iter []
;;

let file_write filename string_list: unit =
  let oc = open_out filename in
  List.iter (fun line -> Printf.fprintf oc "%s\n" line) string_list;
  close_out_noerr oc
;;

let cp source dest: unit =
  file_write dest (file_read source)
;;

let () =
  if (Array.length Sys.argv) - 1 <> 2 then
    begin
      Printf.printf "cp [SOURCE] [DEST]\n";
      exit 1
    end
  else
    let source = Sys.argv.(1) in
    if not (Sys.file_exists source) then
      begin
        Printf.printf "Source file is not found\n";
        exit 2
      end
    else
      let dest = Sys.argv.(2) in
      if not (Sys.file_exists dest) then
        cp source dest
      else
        begin
          print_string "Overwrite? (y/n): ";
          if read_line ()  = "y" then
            begin
              cp source dest;
              exit 0
            end
          else
            exit 0;
        end


