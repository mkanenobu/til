open Printf

let read_line_split =
  try Some (Str.split (Str.regexp " ") (input_line stdin))
  with _ -> None

let push x stack =
  List.cons x stack

let pop stack =
  try List.hd stack
  with _ -> printf "Stack underflow"; exit 1

let main stack =
  let splitted_line =
    match read_line_split with
    | Some string_line -> string_line
    | _ -> printf "Invalid input"; exit 1


let () =
  while true do
    let splitted_line =
      match read_line_split with
      | Some sl -> sl
      | None -> ignore (exit 1); ()
  done;

