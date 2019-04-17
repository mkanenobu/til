let list_in_list = [[1; 2; 3]; [4; 5; 6]]

let print_list_rec l =
  List.iter
    (function e -> (List.iter (function e' -> Printf.printf "%d\n" e')) e)
    l

let () = print_list_rec list_in_list
