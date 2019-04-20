type int_pair = int * int;;

let l ((a, b): int_pair) =
  match (a, b) with
  | (a', b') when a + b > 10 -> None
  | _ -> Some (a, b)
;;

let () =
  let (a, b) = (
    match l (3, 5) with
    | Some (a', b') -> (a', b')
    | None -> (0, 0)
  ) in
  Printf.printf "%d\n" a;
  Printf.printf "%d\n" b;
