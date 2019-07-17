(* enum *)
type oneTwoThree = One | Two | Three

let to_int x =
  match x with
  | One -> 1
  | Two -> 2
  | Three -> 3

let l: oneTwoThree list = List.rev [One; Two; Three]

let () =
  List.iter (fun x -> Printf.printf "%d\n" @@ to_int x) l;
