let l = [5;4;3;2;1]

(* pipe: int list -> string list  *)
let pipe list_ =
  list_ |> List.map (string_of_int)
;;

let () =
  List.iter (fun e -> Printf.printf "%S\n" e) (pipe l);

