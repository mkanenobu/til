let t = [6;2;3;4;5];;
let words = ["one"; "two"; "three"];;

let n = match t with
  | [] -> 0
  | x::xs -> x;;

let is_empty_list l =
  match l with
  | [] -> true
  | _ -> false

let () =
  Printf.printf "%d\n" n;
  Printf.printf "%b\n" (is_empty_list t);
  Printf.printf "%b\n" (is_empty_list []);
