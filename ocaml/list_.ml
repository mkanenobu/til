open Printf;;
(* initialize [0; 1; 2; 3; 4] *)
let l1 = List.init 5 (fun n -> n);;
(* initialize [5; 6; 7] *)
let l2 = List.init 3 (fun n -> n + 5);;

let () =
  List.iter (fun e -> printf "%d " e) l1; print_string "\n";
  List.iter (fun e -> printf "%d " e) l2; print_string "\n";
  (* append (like concat, but ocaml concat is like flatten) *)
  let l3 = l1 @ l2 in
  List.iter (fun e -> printf "%d " e) l3; print_string "\n";

  (* get nth element *)
  printf "%d\n" (List.nth l1 3);

