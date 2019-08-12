open Core

let uniq l =
  List.rev (
    let rec iter x l =
      match l with
      | [] -> x
      | hd :: tl -> iter (hd :: x) (List.filter tl ~f:(fun x -> x <> hd))
    in
    iter [] l
  )

let () =
  List.iter (uniq [1; 1; 2; 3; 4 ;5; 5]) ~f:(fun x -> printf "%d\n" x)
