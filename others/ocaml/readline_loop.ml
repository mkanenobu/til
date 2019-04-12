let readLine ic =
  try Some (input_line ic)
  with End_of_file -> None

let readLines ic =
  let rec loop acc =
    match readLine ic with
    | Some line -> loop (line::acc)
    | None -> List.rev acc
  in
  loop []
