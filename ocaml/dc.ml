open Printf

let read_line =
  try Some (input_line stdin)
  with End_of_file -> None

let readLines =
  let rec loop acc =
    match read_line with
    | Some line -> loop (line::acc)
    | None -> List.rev acc
  in
  loop []

let () =
  Printf.printf "%s" (input_line stdin)

