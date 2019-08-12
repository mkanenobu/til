open Core

let l = [1; 2; 3; 4; 5]

let () =
  List.iter (List.take l 2) ~f:(fun x -> printf "%d\n" x)
