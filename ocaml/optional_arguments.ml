(* like List.init *)
let gen ?(start = 0) end_ =
  let rec iter n (list_: int list) =
    if n > end_ then List.rev list_
    else if start >= end_ then []
    else iter (n + 1) (n :: list_)
  in
  iter start []
;;

let () =
  List.iter (fun e -> Printf.printf "%d " e) (gen ?start:(Some 3) 10);
  print_string "\n\n";
  List.iter (fun e -> Printf.printf "%d " e) (gen ~start:3 10);
  print_string "\n\n";
  List.iter (fun e -> Printf.printf "%d " e) (gen 10);

